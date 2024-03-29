$adGroupNames = @("gr1","gr2","gr3")  

# Enumerate through each group name
foreach ($groupName in $adGroupNames) {
  try{
    $groupMembers = Get-ADGroupMember -Identity $groupName -Server "<DomainController>" | Sort-Object Name
  } catch{
    Write-Host "Error occured: $_"
    continue
  }
 # $groupMembers = Get-ADGroupMember -Identity $groupName -Server "<DomainController>" | Sort-Object Name

  # Check if any members were found
  if ($groupMembers) {
    # Display group name and its members
    Write-Host "Group: $($groupName)--------------------------------------------------------------"
    $groupMembers | ForEach-Object { Write-Host "  - $($_.Name)" }
    Write-Host ""  # Add an empty line between groups
  } else {
    # Inform if the group has no members
    Write-Host "Group: $($groupName) - No members found"
    Write-Host ""
  }
}
