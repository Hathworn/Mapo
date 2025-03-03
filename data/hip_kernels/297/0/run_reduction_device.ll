; ModuleID = '../data/hip_kernels/297/0/main.cu'
source_filename = "../data/hip_kernels/297/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13run_reductionPiS_S_iS_E6s_conv = internal unnamed_addr addrspace(3) global [64 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13run_reductionPiS_S_iS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 addrspace(1)* nocapture readnone %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
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
  %20 = mul i32 %19, %6
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %3
  br i1 %23, label %24, label %63

24:                                               ; preds = %5
  %25 = sext i32 %22 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !15, !amdgpu.noclobber !14
  %28 = shl nuw nsw i32 %14, 1
  %29 = mul i32 %28, %27
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %31 = add i32 %29, %30
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !15, !amdgpu.noclobber !14
  %35 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ13run_reductionPiS_S_iS_E6s_conv, i32 0, i32 %30
  store i32 %34, i32 addrspace(3)* %35, align 4, !tbaa !15
  %36 = add i32 %31, %14
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !15, !amdgpu.noclobber !14
  %40 = add nuw nsw i32 %30, %14
  %41 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ13run_reductionPiS_S_iS_E6s_conv, i32 0, i32 %40
  store i32 %39, i32 addrspace(3)* %41, align 4, !tbaa !15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %44

42:                                               ; preds = %56
  %43 = icmp eq i32 %30, 0
  br i1 %43, label %59, label %63

44:                                               ; preds = %24, %56
  %45 = phi i32 [ %14, %24 ], [ %57, %56 ]
  %46 = icmp ult i32 %30, %45
  br i1 %46, label %47, label %56

47:                                               ; preds = %44
  %48 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !15
  %49 = icmp ne i32 %48, 0
  %50 = add nuw nsw i32 %45, %30
  %51 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ13run_reductionPiS_S_iS_E6s_conv, i32 0, i32 %50
  %52 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !15
  %53 = icmp ne i32 %52, 0
  %54 = select i1 %49, i1 %53, i1 false
  %55 = zext i1 %54 to i32
  store i32 %55, i32 addrspace(3)* %35, align 4, !tbaa !15
  br label %56

56:                                               ; preds = %47, %44
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %57 = lshr i32 %45, 1
  %58 = icmp ult i32 %45, 2
  br i1 %58, label %42, label %44, !llvm.loop !20

59:                                               ; preds = %42
  %60 = load i32, i32 addrspace(3)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(3)* @_ZZ13run_reductionPiS_S_iS_E6s_conv, i32 0, i32 0), align 16, !tbaa !15
  %61 = sext i32 %27 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %61
  store i32 %60, i32 addrspace(1)* %62, align 4, !tbaa !15
  br label %63

63:                                               ; preds = %42, %59, %5
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{i32 0, i32 1024}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
