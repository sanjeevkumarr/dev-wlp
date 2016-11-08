# create-cookbook

TODO: Sync server time to global ntp server 

## Supported Platforms

TODO: It support centos7.2

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['create']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### create::default

Include `create` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[create::default]"
  ]
}
```

## License and Authors

Author:: prakash (<prakash@appranix.com>)
