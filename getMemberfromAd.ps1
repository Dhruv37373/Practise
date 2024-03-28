# Define an array to store group names
$adGroupNames = @("Group1", "Group2", "Group3", "...", "Group40")  # Replace with your actual group names

# Enumerate through each group name
foreach ($groupName in $adGroupNames) {
  # Get members of the current group
  $groupMembers = Get-ADGroupMember -Identity $groupName

  # Check if any members were found
  if ($groupMembers) {
    # Display group name and its members
    Write-Host "Group: $($groupName)"
    $groupMembers | ForEach-Object { Write-Host "  - $($_.Name)" }
    Write-Host ""  # Add an empty line between groups
  } else {
    # Inform if the group has no members
    Write-Host "Group: $($groupName) - No members found"
    Write-Host ""
  }
}

