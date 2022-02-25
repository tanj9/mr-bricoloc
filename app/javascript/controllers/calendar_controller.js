import { Controller } from "stimulus"
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin from '@fullcalendar/interaction';

export default class extends Controller {
  static targets = ["tile", "dateend", "datestart"]

  input(event) {
    const date = event.params.date
    //affichage de la case "meeting proposed"
    event.currentTarget.innerHTML = '<div class="meeting-proposed"><i class="fas fa-check-circle"></i></div>' ;
    //check des valeurs du formulaire de date pour déterminer où mettre la date cliquée (end? start?)
    if (this.datestartTarget.value === "") {
      this.datestartTarget.value = date;
    } else if (this.dateendTarget.value === "") {
      this.dateendTarget.value = date;
      // mecanique de mise à jour des cases entre la case de début et de fin
      const startTileNumber = parseInt(this.datestartTarget.value.slice(-2),10);
      const endTileNumber = parseInt(date.slice(-2),10);
      const yearMonth = date.slice(0, 8);
      console.log(yearMonth);
      for (let step = endTileNumber; step > startTileNumber; step--) {
        const endString = step.toLocaleString('en-US', {
          minimumIntegerDigits: 2,
          useGrouping: false
        })
        var id = `tile${yearMonth}${endString}`;
        document.getElementById(id).innerHTML = '<div class="meeting-proposed"><i class="fas fa-check-circle"></i></div>' ;
      }
      // si les 2 champs sont deja remplis : on efface tous les "meeting-proposed" dans les cases et on recommence à start-date
    }else {
      const toErase = document.getElementsByClassName('meeting-proposed');
      Array.from(toErase).forEach( (meeting) => {
        meeting.remove();
      });
      event.currentTarget.innerHTML = '<div class="meeting-proposed"><i class="fas fa-check-circle"></i></div>' ;
      this.datestartTarget.value = date;
      this.dateendTarget.value = "";
    }

  }
}
