; ModuleID = '../data/hip_kernels/1227/13/main.cu'
source_filename = "../data/hip_kernels/1227/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16block_sum_kernelPiiS_E4smem = internal unnamed_addr addrspace(3) global [128 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16block_sum_kernelPiiS_(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %8
  %14 = udiv i32 %11, %8
  %15 = mul i32 %14, %8
  %16 = icmp ugt i32 %11, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %8
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add i32 %13, %20
  %22 = icmp slt i32 %21, %1
  br i1 %22, label %23, label %32

23:                                               ; preds = %3, %23
  %24 = phi i32 [ %30, %23 ], [ %21, %3 ]
  %25 = phi i32 [ %29, %23 ], [ 0, %3 ]
  %26 = sext i32 %24 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !16, !amdgpu.noclobber !5
  %29 = add nsw i32 %28, %25
  %30 = add nsw i32 %24, %19
  %31 = icmp slt i32 %30, %1
  br i1 %31, label %23, label %32, !llvm.loop !20

32:                                               ; preds = %23, %3
  %33 = phi i32 [ 0, %3 ], [ %29, %23 ]
  %34 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16block_sum_kernelPiiS_E4smem, i32 0, i32 %20
  store i32 %33, i32 addrspace(3)* %34, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp ult i16 %7, 2
  br i1 %35, label %36, label %38

36:                                               ; preds = %48, %32
  %37 = icmp eq i32 %20, 0
  br i1 %37, label %50, label %54

38:                                               ; preds = %32, %48
  %39 = phi i32 [ %40, %48 ], [ %8, %32 ]
  %40 = lshr i32 %39, 1
  %41 = icmp ult i32 %20, %40
  br i1 %41, label %42, label %48

42:                                               ; preds = %38
  %43 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !16
  %44 = add nuw nsw i32 %40, %20
  %45 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16block_sum_kernelPiiS_E4smem, i32 0, i32 %44
  %46 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !16
  %47 = add nsw i32 %46, %43
  store i32 %47, i32 addrspace(3)* %34, align 4, !tbaa !16
  br label %48

48:                                               ; preds = %42, %38
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp ult i32 %39, 4
  br i1 %49, label %36, label %38, !llvm.loop !22

50:                                               ; preds = %36
  %51 = load i32, i32 addrspace(3)* getelementptr inbounds ([128 x i32], [128 x i32] addrspace(3)* @_ZZ16block_sum_kernelPiiS_E4smem, i32 0, i32 0), align 16, !tbaa !16
  %52 = zext i32 %12 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %52
  store i32 %51, i32 addrspace(1)* %53, align 4, !tbaa !16
  br label %54

54:                                               ; preds = %50, %36
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
