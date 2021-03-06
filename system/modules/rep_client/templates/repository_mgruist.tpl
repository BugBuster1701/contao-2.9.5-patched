<?php

/**
 * Contao Repository :: Template to uninstall an extension
 *
 * @package    Repository
 * @copyright  Peter Koch 2008-2010
 * @author     Peter Koch, IBK Software AG
 * @license    See accompaning file LICENSE.txt
 */

$rep = &$this->rep;
$theme = &$rep->theme;
$text = &$GLOBALS['TL_LANG']['tl_repository'];

?>

<div id="tl_buttons">
<a href="<?php echo $rep->homeLink; ?>" class="header_back" title="<?php echo $text['goback']; ?>" accesskey="b" onclick="Backend.getScrollOffset();"><?php echo $text['goback']; ?></a>
</div>

<h2 class="sub_headline"><?php echo $text['uninstallextension']; ?></h2>

<div class="mod_repository block">
<form action="<?php echo $rep->f_link; ?>" id="repository_editform" method="post">
<div class="tl_formbody_edit">
<input type="hidden" name="repository_action" value="<?php echo $rep->f_action; ?>" />
<input type="hidden" name="repository_stage" value="<?php echo $rep->f_stage; ?>" />
<input type="hidden" name="repository_extension" value="<?php echo $rep->f_extension; ?>" />

<div class="tl_tbox block">

<?php echo $theme->createImage('stop128', 'STOP!'); ?> 
<?php if (count($rep->deps)): ?>

<div class="warning">
  <?php echo sprintf($text['dependentsdel'], $rep->f_extension); ?> 
</div>
<table class="autowidth">
  <tr>
    <th><?php echo $text['name'][0]; ?></th>
    <th><?php echo $text['version'][0]; ?></th>
    <th><?php echo $text['build']; ?></th>
  </tr>
<?php foreach ($rep->deps as $dep): ?>
  <tr>
    <td><?php echo $dep->extension; ?></td>
    <td><?php echo Repository::formatVersion($dep->version); ?></td>
    <td><?php echo $dep->build; ?></td>
  </tr>
<?php endforeach; ?>
</table>
<?php endif; ?>
<?php if ($rep->f_stage==$rep->uist_confirm): ?>

<div class="question">
<?php echo sprintf($text['okuninstextension'], $rep->f_extension); ?> 
</div>
<?php endif; ?>

</div>
<?php if ($rep->f_stage>=$rep->uist_showlog): ?>

<div class="installlog">
<?php echo $rep->log; ?> 
</div>
<?php endif; ?>

</div>

<div class="mod_repository_submit tl_formbody_submit">

<div class="tl_submit_container">
<?php if (property_exists($rep, 'f_submit')): ?>
  <input type="submit" name="repository_submitbutton" class="tl_submit" value="<?php echo $text[$rep->f_submit]; ?>" />
<?php endif; ?>
  <input type="submit" name="repository_cancelbutton" class="tl_submit" value="<?php echo $text['cancel']; ?>" />
</div>

</div>
</form>
</div>
