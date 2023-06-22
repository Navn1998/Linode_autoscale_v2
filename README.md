# Linode_autoscale_v2
This repository helps do a hands-on autoscaling of linode instance based on CPUUtilisation metric of VMs
Once the prometheus_am_executor is setup you can start it up by using the command 
./prometheus-am-executor -f <"path_to_configfile">/executor.yml -v
You'll be able to see all the alerts coming in from alertmanager in JSON: 

Example output: 

2023/05/25 07:27:52 Got: &template.Data{Receiver:"default", Status:"firing", Alerts:template.Alerts{template.Alert{Status:"firing", Labels:template.KV{"alertname":"InstanceDown", "instance":"localhost:1234", "job":"broken", "monitor":"codelab-monitor"}, Annotations:template.KV{}, StartsAt:time.Date(2016, time.April, 7, 10, 8, 52, 0, time.Location("")), EndsAt:time.Date(1, time.January, 1, 0, 0, 0, 0, time.UTC), GeneratorURL:"http://oldpad:9090/graph#%5B%7B%22expr%22%3A%22up%20%3D%3D%200%22%2C%22tab%22%3A0%7D%5D", Fingerprint:""}, template.Alert{Status:"firing", Labels:template.KV{"alertname":"InstanceDown", "instance":"localhost:5678", "job":"broken", "monitor":"codelab-monitor"}, Annotations:template.KV{}, StartsAt:time.Date(2016, time.April, 7, 10, 8, 52, 0, time.Location("")), EndsAt:time.Date(1, time.January, 1, 0, 0, 0, 0, time.UTC), GeneratorURL:"http://oldpad:9090/graph#%5B%7B%22expr%22%3A%22up%20%3D%3D%200%22%2C%22tab%22%3A0%7D%5D", Fingerprint:""}}, GroupLabels:template.KV{"alertname":"InstanceDown"}, CommonLabels:template.KV{"alertname":"InstanceDown", "instance":"localhost:1234", "job":"broken", "monitor":"codelab-monitor"}, CommonAnnotations:template.KV{}, ExternalURL:"http://oldpad:9093"}
