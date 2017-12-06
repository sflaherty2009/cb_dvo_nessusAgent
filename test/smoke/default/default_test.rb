# # encoding: utf-8

# Inspec test for recipe cb_dvo_nessusAgent::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

if os.windows?
  describe command('"C:\Program Files\Tenable\Nessus Agent\nessuscli.exe" agent status') do
    its('exit_status') { should eq 0 }
  end
end

if os.linux?
  describe command('/opt/nessus_agent/sbin/nessuscli agent status') do
    its('exit_status') { should eq 0 }
  end
end
