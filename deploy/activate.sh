set -euo pipefail

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" # CD:s into car-booking-app/releases/RELEASE/deploy

ln -sfn "$(realpath ..)" ../../../current