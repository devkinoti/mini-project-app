import { Controller } from "@hotwired/stimulus"

import SlimSelect from "slim-select"

// Connects to data-controller="team-member"
export default class extends Controller {
  connect() {
    new SlimSelect({
      select: "#multiple"
    })
  }
}
