<script>
import { mixins } from 'nm-lib-skins'

const api = $api.quartz.group

export default {
  mixins: [mixins.select],
  data() {
    return {
      action: api.select
    }
  }
}
</script>
