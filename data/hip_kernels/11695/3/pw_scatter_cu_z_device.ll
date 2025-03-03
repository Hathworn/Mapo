; ModuleID = '../data/hip_kernels/11695/3/main.cu'
source_filename = "../data/hip_kernels/11695/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15pw_scatter_cu_zPdPKddiiPKi(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = mul i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = add i32 %21, %22
  %24 = mul i32 %23, %14
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %26, %3
  br i1 %27, label %28, label %65

28:                                               ; preds = %6
  %29 = shl nsw i32 %26, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %1, i64 %30
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !16, !amdgpu.noclobber !14
  %33 = fmul contract double %32, %2
  %34 = sext i32 %26 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !20, !amdgpu.noclobber !14
  %37 = shl nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  store double %33, double addrspace(1)* %39, align 8, !tbaa !16
  %40 = add nuw nsw i32 %29, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %1, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !16
  %44 = fmul contract double %43, %2
  %45 = add nuw nsw i32 %37, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  store double %44, double addrspace(1)* %47, align 8, !tbaa !16
  %48 = icmp eq i32 %4, 2
  br i1 %48, label %49, label %65

49:                                               ; preds = %28
  %50 = load double, double addrspace(1)* %31, align 8, !tbaa !16
  %51 = fmul contract double %50, %2
  %52 = add nsw i32 %26, %3
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !20, !amdgpu.noclobber !14
  %56 = shl nsw i32 %55, 1
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %0, i64 %57
  store double %51, double addrspace(1)* %58, align 8, !tbaa !16
  %59 = fneg contract double %2
  %60 = load double, double addrspace(1)* %42, align 8, !tbaa !16
  %61 = fmul contract double %60, %59
  %62 = add nuw nsw i32 %56, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %0, i64 %63
  store double %61, double addrspace(1)* %64, align 8, !tbaa !16
  br label %65

65:                                               ; preds = %28, %49, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
