
#include "sched.h"
#include "stdlist.h"
int TASK_READY;

static void dequeue_task_simple(struct ready_queue_base *rq,
		struct task_struct *p)
{
	rq->ready_task_num--;
	list_remove(&p->run_list);
}

static void enqueue_task_simple(struct ready_queue_base *rq,
		struct task_struct *p)
{
	list_append(&p->run_list, &rq->ready_list)
	;
	kprintf("append p->runlist=%x\n",&p->run_list);
	rq->ready_task_num++;
	kprintf("ready_task_num=%d\n",rq->ready_task_num);
}





static struct task_struct *pick_next_task_simple(struct ready_queue_base *rq,
		struct task_struct *prev)
{
	struct task_struct *next;
	// struct list_elem_t *tmp;
	// list_for_each(temp,rq->ready_list->head)
	// 	p = list_entry(tmp, struct task_struct, run_list);
	next=list_entry((rq->ready_list.head.next), struct task_struct, run_list);
	
	list_elem_t* pop_elem=list_pop(&rq->ready_list);
	list_append(pop_elem,&rq->ready_list);

	kprintf("\n====================\nok,ready list will select next thread...\n");
	kprintf("pick next pid[%d]\n====================\n ",next->pid);
	if(next->counter<=0){
		next->counter+=DEF_COUNTER + next->priority;;
	}
	return next;
}



/*简易调度计时器*/
void task_tick_simple(struct ready_queue_base *rq, struct task_struct *p)
{
	
	p->counter=(p->counter)-1;
	
	if (p->counter <= 0) {
		p->counter = 0;
		p->need_resched = 1;	
	}
	
}

/*建议调度类的实现*/
const struct sched_class simple_sched_class = {
	.next = NULL,
	.dequeue_task = dequeue_task_simple,
	.enqueue_task = enqueue_task_simple,
	.task_tick = task_tick_simple,
	.pick_next_task = pick_next_task_simple,
};

