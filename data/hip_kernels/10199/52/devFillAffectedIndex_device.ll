; ModuleID = '../data/hip_kernels/10199/52/main.cu'
source_filename = "../data/hip_kernels/10199/52/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z20devFillAffectedIndexiiPi(i32 %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %0
  br i1 %16, label %17, label %112

17:                                               ; preds = %3
  %18 = icmp sgt i32 %1, 0
  %19 = mul nsw i32 %1, %0
  %20 = udiv i32 %12, %9
  %21 = mul i32 %20, %9
  %22 = icmp ugt i32 %12, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %9
  %26 = and i32 %1, 7
  %27 = icmp ult i32 %1, 8
  %28 = and i32 %1, -8
  %29 = icmp eq i32 %26, 0
  br label %30

30:                                               ; preds = %17, %48
  %31 = phi i32 [ %15, %17 ], [ %49, %48 ]
  br i1 %18, label %32, label %48

32:                                               ; preds = %30
  %33 = mul nsw i32 %31, %1
  br i1 %27, label %34, label %51

34:                                               ; preds = %51, %32
  %35 = phi i32 [ 0, %32 ], [ %109, %51 ]
  br i1 %29, label %48, label %36

36:                                               ; preds = %34, %36
  %37 = phi i32 [ %45, %36 ], [ %35, %34 ]
  %38 = phi i32 [ %46, %36 ], [ 0, %34 ]
  %39 = add nsw i32 %37, %33
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %40
  store i32 %31, i32 addrspace(1)* %41, align 4, !tbaa !16
  %42 = add nsw i32 %39, %19
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %43
  store i32 %31, i32 addrspace(1)* %44, align 4, !tbaa !16
  %45 = add nuw nsw i32 %37, 1
  %46 = add i32 %38, 1
  %47 = icmp eq i32 %46, %26
  br i1 %47, label %48, label %36, !llvm.loop !20

48:                                               ; preds = %34, %36, %30
  %49 = add i32 %25, %31
  %50 = icmp slt i32 %49, %0
  br i1 %50, label %30, label %112, !llvm.loop !22

51:                                               ; preds = %32, %51
  %52 = phi i32 [ %109, %51 ], [ 0, %32 ]
  %53 = phi i32 [ %110, %51 ], [ 0, %32 ]
  %54 = add nsw i32 %52, %33
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %55
  store i32 %31, i32 addrspace(1)* %56, align 4, !tbaa !16
  %57 = add nsw i32 %54, %19
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %58
  store i32 %31, i32 addrspace(1)* %59, align 4, !tbaa !16
  %60 = or i32 %52, 1
  %61 = add nsw i32 %60, %33
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %62
  store i32 %31, i32 addrspace(1)* %63, align 4, !tbaa !16
  %64 = add nsw i32 %61, %19
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %65
  store i32 %31, i32 addrspace(1)* %66, align 4, !tbaa !16
  %67 = or i32 %52, 2
  %68 = add nsw i32 %67, %33
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %69
  store i32 %31, i32 addrspace(1)* %70, align 4, !tbaa !16
  %71 = add nsw i32 %68, %19
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %72
  store i32 %31, i32 addrspace(1)* %73, align 4, !tbaa !16
  %74 = or i32 %52, 3
  %75 = add nsw i32 %74, %33
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %76
  store i32 %31, i32 addrspace(1)* %77, align 4, !tbaa !16
  %78 = add nsw i32 %75, %19
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %79
  store i32 %31, i32 addrspace(1)* %80, align 4, !tbaa !16
  %81 = or i32 %52, 4
  %82 = add nsw i32 %81, %33
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %83
  store i32 %31, i32 addrspace(1)* %84, align 4, !tbaa !16
  %85 = add nsw i32 %82, %19
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %86
  store i32 %31, i32 addrspace(1)* %87, align 4, !tbaa !16
  %88 = or i32 %52, 5
  %89 = add nsw i32 %88, %33
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %90
  store i32 %31, i32 addrspace(1)* %91, align 4, !tbaa !16
  %92 = add nsw i32 %89, %19
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %93
  store i32 %31, i32 addrspace(1)* %94, align 4, !tbaa !16
  %95 = or i32 %52, 6
  %96 = add nsw i32 %95, %33
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %97
  store i32 %31, i32 addrspace(1)* %98, align 4, !tbaa !16
  %99 = add nsw i32 %96, %19
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %100
  store i32 %31, i32 addrspace(1)* %101, align 4, !tbaa !16
  %102 = or i32 %52, 7
  %103 = add nsw i32 %102, %33
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %104
  store i32 %31, i32 addrspace(1)* %105, align 4, !tbaa !16
  %106 = add nsw i32 %103, %19
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %107
  store i32 %31, i32 addrspace(1)* %108, align 4, !tbaa !16
  %109 = add nuw nsw i32 %52, 8
  %110 = add i32 %53, 8
  %111 = icmp eq i32 %110, %28
  br i1 %111, label %34, label %51, !llvm.loop !24

112:                                              ; preds = %48, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
