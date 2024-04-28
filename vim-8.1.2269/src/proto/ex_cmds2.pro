/* ex_cmds2.c */
long proftime_time_left(proftime_T *due, proftime_T *now);
timer_T *create_timer(long msec, int repeat);
long check_due_timer(void);
void stop_timer(timer_T *timer);
int set_ref_in_timer(int copyID);
void timer_free_all(void);
void f_timer_info(typval_T *argvars, typval_T *rettv);
void f_timer_pause(typval_T *argvars, typval_T *rettv);
void f_timer_start(typval_T *argvars, typval_T *rettv);
void f_timer_stop(typval_T *argvars, typval_T *rettv);
void f_timer_stopall(typval_T *argvars, typval_T *rettv);
int autowrite(buf_T *buf, int forceit);
void autowrite_all(void);
int check_changed(buf_T *buf, int flags);
void browse_save_fname(buf_T *buf);
void dialog_changed(buf_T *buf, int checkall);
int can_abandon(buf_T *buf, int forceit);
int check_changed_any(int hidden, int unload);
int check_fname(void);
int buf_write_all(buf_T *buf, int forceit);
void ex_listdo(exarg_T *eap);
void ex_compiler(exarg_T *eap);
void init_pyxversion(void);
void ex_pyxfile(exarg_T *eap);
void ex_pyx(exarg_T *eap);
void ex_pyxdo(exarg_T *eap);
void ex_checktime(exarg_T *eap);
char_u *get_mess_lang(void);
void set_lang_var(void);
void ex_language(exarg_T *eap);
void free_locales(void);
char_u *get_lang_arg(expand_T *xp, int idx);
char_u *get_locales(expand_T *xp, int idx);
/* vim: set ft=c : */