import { Controller } from "stimulus"
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin from '@fullcalendar/interaction';

export default class extends Controller {
  static targets = ["render"]

  connect() {
    let calendar = new Calendar(this.renderTarget, {
      plugins: [ dayGridPlugin, timeGridPlugin, listPlugin, interactionPlugin],
      initialView: 'dayGridMonth',
      selectable: true,
      selectOverlap: false,
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,listWeek'
      },
      events:'bookings.json', // use the `url` property
    });
    calendar.render()
  }
}
