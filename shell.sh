VERSION=${{ env.VERSION }}
echo "Current Version: $VERSION"

# Extract major, minor, patch from version
IFS='.' read -r MAJOR MINOR PATCH <<<"${VERSION#v}"

# Debug output for the parsed version values
echo "MAJOR: $MAJOR, MINOR: $MINOR, PATCH: $PATCH"

# Ensure proper assignment of variables if not set
if [ -z "$MAJOR" ]; then MAJOR=0; fi
if [ -z "$MINOR" ]; then MINOR=0; fi
if [ -z "$PATCH" ]; then PATCH=0; fi

# Convert variables to integers (to avoid errors in arithmetic)
MAJOR=$((MAJOR))
MINOR=$((MINOR))
PATCH=$((PATCH))

# Check commit message for version type and bump accordingly
COMMIT_MESSAGE="AL-2023 # major: create initial version of random password module"
echo "Commit Message: $COMMIT_MESSAGE"

if [[ "$COMMIT_MESSAGE" == *"# major"* ]]; then
  echo "Detected major version bump"
  ((MAJOR++))
  MINOR=0
  PATCH=0
elif [[ "$COMMIT_MESSAGE" == *"# minor"* ]]; then
  echo "Detected minor version bump"
  ((MINOR++))
  PATCH=0
else
  echo "Detected patch version bump"
  ((PATCH++))
fi

# Set the new version number
NEW_VERSION="v$MAJOR.$MINOR.$PATCH"
echo "New Version: $NEW_VERSION"