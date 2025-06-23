#!/usr/bin/env bash
#
# make_linear_dcps.sh  —  Convert every *.dcp in (sub)folders to
# “Adobe Standard Linear + 1-1 Tone Curve” versions.
#
# REQUIREMENTS
#   • dcptool   — https://dcptool.sourceforge.net/
#   • GNU awk   (macOS: `brew install gawk`)
#
# USAGE
#   chmod +x make_linear_dcps.sh
#   ./make_linear_dcps.sh  /path/to/folder-with-dcps
#
#   It will create a new “[name] Linear.dcp” next to each original file.

set -euo pipefail

root="${1:-.}"                     # default = cwd
shopt -s globstar nullglob         # ** recursive glob, ignore unmatched

for dcp in "$root"/**/*.dcp; do
  [[ -f $dcp ]] || continue        # skip if no matches in some dir

  base="${dcp%.*}"                 # strip .dcp
  xml="${base}.xml"

  echo "► Converting: $dcp"
  dcptool -d "$dcp" "$xml"         # 1) decompile

  # 2-5) edit the XML → tmp, then overwrite original xml
  awk '
    BEGIN {look=0; tone=0; inserted=0}
    # -------- delete LookTable block --------
    /<LookTable/ {look=1; next}
    look && /<\/LookTable>/ {look=0; next}
    look {next}

    # -------- delete original ToneCurve block --------
    /<ToneCurve[[:space:]]/ {tone=1; next}
    tone && /<\/ToneCurve>/ {tone=0; next}
    tone {next}

    # -------- do in-line substitutions --------
    {
      gsub(/<ProfileName>Adobe Standard<\/ProfileName>/,
           "<ProfileName>Adobe Standard Linear</ProfileName>");
      gsub(/<DefaultBlackRender>0<\/DefaultBlackRender>/,
           "<DefaultBlackRender>1</DefaultBlackRender>");
      print

      # 4) inject new linear ToneCurve *once* right before ProfileCalibrationSignature
      if (!inserted && /<ProfileCalibrationSignature>/) {
        print "  <ToneCurve Size=\"2\">";
        print "    <Element N=\"0\" h=\"0.000000\" v=\"0.000000\"/>";
        print "    <Element N=\"1\" h=\"1.000000\" v=\"1.000000\"/>";
        print "  </ToneCurve>";
        inserted=1
      }
    }
  ' "$xml" > "${xml}.tmp"

  mv "${xml}.tmp" "$xml"

  # 6) re-compile to “Linear.dcp”
  dcptool -c "$xml" "${base} Linear.dcp"

  echo "   → ${base} Linear.dcp created"
done

echo "✓ All done."
