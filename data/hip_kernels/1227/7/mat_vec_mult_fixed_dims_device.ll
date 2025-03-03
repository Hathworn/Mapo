; ModuleID = '../data/hip_kernels/1227/7/main.cu'
source_filename = "../data/hip_kernels/1227/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23mat_vec_mult_fixed_dimsPiS_S_E4smem = internal unnamed_addr addrspace(3) global [128 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23mat_vec_mult_fixed_dimsPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %6 = bitcast i8 addrspace(4)* %5 to i32 addrspace(4)*
  %7 = load i32, i32 addrspace(4)* %6, align 4, !tbaa !4
  %8 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !13, !invariant.load !14
  %11 = zext i16 %10 to i32
  %12 = udiv i32 %7, %11
  %13 = mul i32 %12, %11
  %14 = icmp ugt i32 %7, %13
  %15 = zext i1 %14 to i32
  %16 = add i32 %12, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23mat_vec_mult_fixed_dimsPiS_S_E4smem, i32 0, i32 %18
  %20 = icmp ult i16 %10, 2
  %21 = icmp eq i32 %18, 0
  %22 = udiv i16 511, %10
  %23 = zext i16 %22 to i32
  br label %25

24:                                               ; preds = %68
  ret void

25:                                               ; preds = %3, %68
  %26 = phi i32 [ 0, %3 ], [ %70, %68 ]
  %27 = phi i32 [ 0, %3 ], [ %69, %68 ]
  %28 = add i32 %26, %17
  %29 = shl nsw i32 %28, 9
  br label %31

30:                                               ; preds = %60
  br i1 %21, label %65, label %68

31:                                               ; preds = %25, %60
  %32 = phi i32 [ 0, %25 ], [ %63, %60 ]
  %33 = phi i32 [ 0, %25 ], [ %62, %60 ]
  %34 = phi i32 [ 0, %25 ], [ %61, %60 ]
  %35 = add nuw nsw i32 %32, %18
  %36 = add nsw i32 %35, %29
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !16
  %40 = zext i32 %35 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !16
  %43 = mul nsw i32 %42, %39
  store i32 %43, i32 addrspace(3)* %19, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %20, label %44, label %45

44:                                               ; preds = %55, %31
  br i1 %21, label %57, label %60

45:                                               ; preds = %31, %55
  %46 = phi i32 [ %47, %55 ], [ %11, %31 ]
  %47 = lshr i32 %46, 1
  %48 = icmp ult i32 %18, %47
  br i1 %48, label %49, label %55

49:                                               ; preds = %45
  %50 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !16
  %51 = add nuw nsw i32 %47, %18
  %52 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ23mat_vec_mult_fixed_dimsPiS_S_E4smem, i32 0, i32 %51
  %53 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !16
  %54 = add nsw i32 %53, %50
  store i32 %54, i32 addrspace(3)* %19, align 4, !tbaa !16
  br label %55

55:                                               ; preds = %49, %45
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = icmp ult i32 %46, 4
  br i1 %56, label %44, label %45, !llvm.loop !20

57:                                               ; preds = %44
  %58 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !16
  %59 = add nsw i32 %58, %34
  br label %60

60:                                               ; preds = %57, %44
  %61 = phi i32 [ %59, %57 ], [ %34, %44 ]
  %62 = add nuw nsw i32 %33, 1
  %63 = mul nuw nsw i32 %62, %11
  %64 = icmp eq i32 %33, %23
  br i1 %64, label %30, label %31, !llvm.loop !22

65:                                               ; preds = %30
  %66 = sext i32 %28 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %66
  store i32 %61, i32 addrspace(1)* %67, align 4, !tbaa !16
  br label %68

68:                                               ; preds = %65, %30
  %69 = add nuw nsw i32 %27, 1
  %70 = mul i32 %16, %69
  %71 = icmp ult i32 %70, 1024
  br i1 %71, label %25, label %24, !llvm.loop !23
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
