; ModuleID = '../data/hip_kernels/12/0/main.cu'
source_filename = "../data/hip_kernels/12/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10ReduceRalfPxS_iiE2sm = internal unnamed_addr addrspace(3) global [1024 x i64] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10ReduceRalfPxS_ii(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %5, %3
  %17 = add i32 %16, %15
  %18 = icmp slt i32 %17, %2
  br i1 %18, label %19, label %23

19:                                               ; preds = %4
  %20 = sext i32 %17 to i64
  %21 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %20
  %22 = load i64, i64 addrspace(1)* %21, align 8, !tbaa !16, !amdgpu.noclobber !6
  br label %23

23:                                               ; preds = %19, %4
  %24 = phi i64 [ %22, %19 ], [ 0, %4 ]
  %25 = udiv i32 %14, %11
  %26 = mul i32 %25, %11
  %27 = icmp ugt i32 %14, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %11
  %31 = add i32 %30, %17
  %32 = icmp ult i32 %31, %2
  br i1 %32, label %33, label %38

33:                                               ; preds = %23
  %34 = zext i32 %31 to i64
  %35 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %34
  %36 = load i64, i64 addrspace(1)* %35, align 8, !tbaa !16, !amdgpu.noclobber !6
  %37 = add nsw i64 %36, %24
  br label %38

38:                                               ; preds = %33, %23
  %39 = phi i64 [ %37, %33 ], [ %24, %23 ]
  %40 = getelementptr inbounds [1024 x i64], [1024 x i64] addrspace(3)* @_ZZ10ReduceRalfPxS_iiE2sm, i32 0, i32 %5
  store i64 %39, i64 addrspace(3)* %40, align 8, !tbaa !16
  %41 = icmp ult i16 %10, 2
  br i1 %41, label %42, label %44

42:                                               ; preds = %54, %38
  %43 = icmp eq i32 %5, 0
  br i1 %43, label %56, label %60

44:                                               ; preds = %38, %54
  %45 = phi i32 [ %46, %54 ], [ %11, %38 ]
  %46 = lshr i32 %45, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = icmp ult i32 %5, %46
  br i1 %47, label %48, label %54

48:                                               ; preds = %44
  %49 = load i64, i64 addrspace(3)* %40, align 8, !tbaa !16
  %50 = add nuw nsw i32 %46, %5
  %51 = getelementptr inbounds [1024 x i64], [1024 x i64] addrspace(3)* @_ZZ10ReduceRalfPxS_iiE2sm, i32 0, i32 %50
  %52 = load i64, i64 addrspace(3)* %51, align 8, !tbaa !16
  %53 = add nsw i64 %52, %49
  store i64 %53, i64 addrspace(3)* %40, align 8, !tbaa !16
  br label %54

54:                                               ; preds = %44, %48
  %55 = icmp ult i32 %45, 4
  br i1 %55, label %42, label %44, !llvm.loop !20

56:                                               ; preds = %42
  %57 = load i64, i64 addrspace(3)* getelementptr inbounds ([1024 x i64], [1024 x i64] addrspace(3)* @_ZZ10ReduceRalfPxS_iiE2sm, i32 0, i32 0), align 16, !tbaa !16
  %58 = zext i32 %6 to i64
  %59 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %58
  store i64 %57, i64 addrspace(1)* %59, align 8, !tbaa !16
  br label %60

60:                                               ; preds = %56, %42
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"long long", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
