; ModuleID = '../data/hip_kernels/3916/73/main.cu'
source_filename = "../data/hip_kernels/3916/73/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@temp = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6scan_yPiS_i(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = udiv i32 %13, %10
  %15 = mul i32 %14, %10
  %16 = icmp ugt i32 %13, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = shl nuw nsw i32 %4, 1
  %20 = mul nsw i32 %18, %19
  %21 = add nsw i32 %20, %5
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !16, !amdgpu.noclobber !6
  %25 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %19
  store i32 %24, i32 addrspace(3)* %25, align 4, !tbaa !16
  %26 = add nsw i32 %21, %18
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !6
  %30 = add nuw nsw i32 %19, 1
  %31 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %30
  store i32 %29, i32 addrspace(3)* %31, align 4, !tbaa !16
  %32 = icmp sgt i32 %2, 1
  br i1 %32, label %33, label %35

33:                                               ; preds = %3
  %34 = add nuw nsw i32 %19, 2
  br label %38

35:                                               ; preds = %53, %3
  %36 = phi i32 [ 1, %3 ], [ %54, %53 ]
  %37 = icmp eq i32 %4, 0
  br i1 %37, label %56, label %59

38:                                               ; preds = %33, %53
  %39 = phi i32 [ %2, %33 ], [ %41, %53 ]
  %40 = phi i32 [ 1, %33 ], [ %54, %53 ]
  %41 = ashr i32 %39, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = icmp slt i32 %4, %41
  br i1 %42, label %43, label %53

43:                                               ; preds = %38
  %44 = mul nsw i32 %40, %30
  %45 = add nsw i32 %44, -1
  %46 = mul nsw i32 %40, %34
  %47 = add nsw i32 %46, -1
  %48 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %45
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !16
  %50 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %47
  %51 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !16
  %52 = add nsw i32 %51, %49
  store i32 %52, i32 addrspace(3)* %50, align 4, !tbaa !16
  br label %53

53:                                               ; preds = %43, %38
  %54 = shl nsw i32 %40, 1
  %55 = icmp sgt i32 %39, 3
  br i1 %55, label %38, label %35, !llvm.loop !20

56:                                               ; preds = %35
  %57 = add nsw i32 %2, -1
  %58 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %57
  store i32 0, i32 addrspace(3)* %58, align 4, !tbaa !16
  br label %59

59:                                               ; preds = %56, %35
  %60 = add nuw nsw i32 %19, 2
  br i1 %32, label %66, label %61

61:                                               ; preds = %82, %59
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !16
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  store i32 %62, i32 addrspace(1)* %63, align 4, !tbaa !16
  %64 = shl nuw nsw i32 %10, 1
  %65 = icmp eq i32 %60, %64
  br i1 %65, label %85, label %88

66:                                               ; preds = %59, %82
  %67 = phi i32 [ %69, %82 ], [ %36, %59 ]
  %68 = phi i32 [ %83, %82 ], [ 1, %59 ]
  %69 = lshr i32 %67, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = icmp slt i32 %4, %68
  br i1 %70, label %71, label %82

71:                                               ; preds = %66
  %72 = mul nsw i32 %69, %30
  %73 = add nsw i32 %72, -1
  %74 = mul nsw i32 %69, %60
  %75 = add nsw i32 %74, -1
  %76 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %73
  %77 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !16
  %78 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %75
  %79 = load i32, i32 addrspace(3)* %78, align 4, !tbaa !16
  store i32 %79, i32 addrspace(3)* %76, align 4, !tbaa !16
  %80 = load i32, i32 addrspace(3)* %78, align 4, !tbaa !16
  %81 = add nsw i32 %80, %77
  store i32 %81, i32 addrspace(3)* %78, align 4, !tbaa !16
  br label %82

82:                                               ; preds = %66, %71
  %83 = shl nsw i32 %68, 1
  %84 = icmp slt i32 %83, %2
  br i1 %84, label %66, label %61, !llvm.loop !22

85:                                               ; preds = %61
  %86 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !16
  %87 = add nsw i32 %86, %62
  br label %91

88:                                               ; preds = %61
  %89 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %60
  %90 = load i32, i32 addrspace(3)* %89, align 4, !tbaa !16
  br label %91

91:                                               ; preds = %88, %85
  %92 = phi i32 [ %87, %85 ], [ %90, %88 ]
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  store i32 %92, i32 addrspace(1)* %93, align 4
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
