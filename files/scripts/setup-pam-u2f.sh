#!/usr/bin/env bash

set -euo pipefail

# For a "Touch ID" like experience (Sufficient)
authselect select sssd with-pam-u2f --force

# Append 'cue' to the pam_u2f.so lines in system-auth and password-auth
sed -i 's/pam_u2f.so/pam_u2f.so cue/g' /etc/authselect/system-auth
sed -i 's/pam_u2f.so/pam_u2f.so cue/g' /etc/authselect/password-auth

# Re-apply the changes
authselect apply-changes
