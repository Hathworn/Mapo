; ModuleID = '../data/hip_kernels/2766/4/main.cu'
source_filename = "../data/hip_kernels/2766/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@partialSum = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27cudaUpdateFiringRate_kernelPiS_jjj(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = mul i32 %3, %2
  %7 = mul i32 %6, %4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = mul i32 %9, %14
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %20 = add i32 %18, %19
  %21 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @partialSum, i32 0, i32 %19
  store i32 0, i32 addrspace(3)* %21, align 4, !tbaa !16
  %22 = icmp ult i32 %20, %7
  br i1 %22, label %23, label %29

23:                                               ; preds = %5
  %24 = mul i32 %7, %8
  %25 = add i32 %20, %24
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !16, !amdgpu.noclobber !5
  store i32 %28, i32 addrspace(3)* %21, align 4, !tbaa !16
  br label %29

29:                                               ; preds = %23, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = icmp ult i16 %13, 2
  br i1 %30, label %31, label %33

31:                                               ; preds = %43, %29
  %32 = icmp eq i32 %19, 0
  br i1 %32, label %45, label %56

33:                                               ; preds = %29, %43
  %34 = phi i32 [ %35, %43 ], [ %14, %29 ]
  %35 = lshr i32 %34, 1
  %36 = icmp ult i32 %19, %35
  br i1 %36, label %37, label %43

37:                                               ; preds = %33
  %38 = add nuw nsw i32 %35, %19
  %39 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @partialSum, i32 0, i32 %38
  %40 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !16
  %41 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !16
  %42 = add i32 %41, %40
  store i32 %42, i32 addrspace(3)* %21, align 4, !tbaa !16
  br label %43

43:                                               ; preds = %37, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = icmp ult i32 %34, 4
  br i1 %44, label %31, label %33, !llvm.loop !20

45:                                               ; preds = %31
  %46 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @partialSum, i32 0, i32 0), align 4, !tbaa !16
  %47 = udiv i32 %17, %14
  %48 = mul i32 %47, %14
  %49 = icmp ugt i32 %17, %48
  %50 = zext i1 %49 to i32
  %51 = add i32 %47, %50
  %52 = mul i32 %51, %8
  %53 = add i32 %52, %9
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %54
  store i32 %46, i32 addrspace(1)* %55, align 4, !tbaa !16
  br label %56

56:                                               ; preds = %45, %31
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
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
