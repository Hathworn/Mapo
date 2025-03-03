; ModuleID = '../data/hip_kernels/246/0/main.cu'
source_filename = "../data/hip_kernels/246/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ25dotProduct_dVector_kernelPdS_S_iE12partial_sums = internal unnamed_addr addrspace(3) global [1024 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z25dotProduct_dVector_kernelPdS_S_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = mul i32 %5, %10
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %3
  br i1 %17, label %18, label %37

18:                                               ; preds = %4
  %19 = udiv i32 %13, %10
  %20 = mul i32 %19, %10
  %21 = icmp ugt i32 %13, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %10
  br label %25

25:                                               ; preds = %18, %25
  %26 = phi double [ 0.000000e+00, %18 ], [ %34, %25 ]
  %27 = phi i32 [ %16, %18 ], [ %35, %25 ]
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %0, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !16, !amdgpu.noclobber !5
  %31 = getelementptr inbounds double, double addrspace(1)* %1, i64 %28
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !16, !amdgpu.noclobber !5
  %33 = fmul contract double %30, %32
  %34 = fadd contract double %26, %33
  %35 = add i32 %24, %27
  %36 = icmp slt i32 %35, %3
  br i1 %36, label %25, label %37, !llvm.loop !20

37:                                               ; preds = %25, %4
  %38 = phi double [ 0.000000e+00, %4 ], [ %34, %25 ]
  %39 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ25dotProduct_dVector_kernelPdS_S_iE12partial_sums, i32 0, i32 %15
  store double %38, double addrspace(3)* %39, align 8, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp ult i16 %9, 2
  br i1 %40, label %53, label %41

41:                                               ; preds = %37, %51
  %42 = phi i32 [ %43, %51 ], [ %10, %37 ]
  %43 = lshr i32 %42, 1
  %44 = icmp ult i32 %15, %43
  br i1 %44, label %45, label %51

45:                                               ; preds = %41
  %46 = add nuw nsw i32 %43, %15
  %47 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ25dotProduct_dVector_kernelPdS_S_iE12partial_sums, i32 0, i32 %46
  %48 = load double, double addrspace(3)* %47, align 8, !tbaa !16
  %49 = load double, double addrspace(3)* %39, align 8, !tbaa !16
  %50 = fadd contract double %48, %49
  store double %50, double addrspace(3)* %39, align 8, !tbaa !16
  br label %51

51:                                               ; preds = %45, %41
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = icmp ult i32 %42, 4
  br i1 %52, label %53, label %41, !llvm.loop !22

53:                                               ; preds = %51, %37
  %54 = icmp eq i32 %15, 0
  br i1 %54, label %55, label %59

55:                                               ; preds = %53
  %56 = load double, double addrspace(3)* getelementptr inbounds ([1024 x double], [1024 x double] addrspace(3)* @_ZZ25dotProduct_dVector_kernelPdS_S_iE12partial_sums, i32 0, i32 0), align 16, !tbaa !16
  %57 = zext i32 %5 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %2, i64 %57
  store double %56, double addrspace(1)* %58, align 8, !tbaa !16
  br label %59

59:                                               ; preds = %55, %53
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
