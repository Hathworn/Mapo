; ModuleID = '../data/hip_kernels/7041/24/main.cu'
source_filename = "../data/hip_kernels/7041/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z12KernelMemsetPbib(i8 addrspace(1)* nocapture writeonly %0, i32 %1, i1 %2) local_unnamed_addr #0 {
  %4 = zext i1 %2 to i8
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
  %17 = udiv i32 %13, %10
  %18 = mul i32 %17, %10
  %19 = icmp ugt i32 %13, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %10
  %23 = icmp slt i32 %16, %1
  br i1 %23, label %24, label %125

24:                                               ; preds = %3
  %25 = add i32 %5, %17
  %26 = add i32 %25, %20
  %27 = mul i32 %26, %10
  %28 = add i32 %15, %27
  %29 = tail call i32 @llvm.smax.i32(i32 %1, i32 %28)
  %30 = icmp slt i32 %28, %1
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = sub i32 %29, %32
  %34 = udiv i32 %33, %22
  %35 = add i32 %34, %31
  %36 = add i32 %35, 1
  %37 = icmp ult i32 %36, 4
  br i1 %37, label %123, label %38

38:                                               ; preds = %24
  %39 = and i32 %36, -4
  %40 = mul i32 %39, %22
  %41 = add i32 %16, %40
  %42 = insertelement <4 x i32> poison, i32 %16, i64 0
  %43 = shufflevector <4 x i32> %42, <4 x i32> poison, <4 x i32> zeroinitializer
  %44 = insertelement <4 x i32> poison, i32 %22, i64 0
  %45 = shufflevector <4 x i32> %44, <4 x i32> poison, <4 x i32> zeroinitializer
  %46 = mul <4 x i32> %45, <i32 0, i32 1, i32 2, i32 3>
  %47 = add <4 x i32> %43, %46
  %48 = shl i32 %22, 2
  %49 = insertelement <4 x i32> poison, i32 %48, i64 0
  %50 = shufflevector <4 x i32> %49, <4 x i32> poison, <4 x i32> zeroinitializer
  %51 = add i32 %35, -3
  %52 = lshr i32 %51, 2
  %53 = add nuw nsw i32 %52, 1
  %54 = and i32 %53, 3
  %55 = icmp ult i32 %51, 12
  br i1 %55, label %103, label %56

56:                                               ; preds = %38
  %57 = and i32 %53, -4
  br label %58

58:                                               ; preds = %58, %56
  %59 = phi <4 x i32> [ %47, %56 ], [ %100, %58 ]
  %60 = phi i32 [ 0, %56 ], [ %101, %58 ]
  %61 = sext <4 x i32> %59 to <4 x i64>
  %62 = extractelement <4 x i64> %61, i64 0
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %62
  %64 = extractelement <4 x i64> %61, i64 1
  %65 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %64
  %66 = extractelement <4 x i64> %61, i64 2
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %66
  %68 = extractelement <4 x i64> %61, i64 3
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %68
  store i8 %4, i8 addrspace(1)* %63, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %65, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %67, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %69, align 1, !tbaa !16
  %70 = add <4 x i32> %59, %50
  %71 = sext <4 x i32> %70 to <4 x i64>
  %72 = extractelement <4 x i64> %71, i64 0
  %73 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %72
  %74 = extractelement <4 x i64> %71, i64 1
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %74
  %76 = extractelement <4 x i64> %71, i64 2
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %76
  %78 = extractelement <4 x i64> %71, i64 3
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %78
  store i8 %4, i8 addrspace(1)* %73, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %75, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %77, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %79, align 1, !tbaa !16
  %80 = add <4 x i32> %70, %50
  %81 = sext <4 x i32> %80 to <4 x i64>
  %82 = extractelement <4 x i64> %81, i64 0
  %83 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %82
  %84 = extractelement <4 x i64> %81, i64 1
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %84
  %86 = extractelement <4 x i64> %81, i64 2
  %87 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %86
  %88 = extractelement <4 x i64> %81, i64 3
  %89 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %88
  store i8 %4, i8 addrspace(1)* %83, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %85, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %87, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %89, align 1, !tbaa !16
  %90 = add <4 x i32> %80, %50
  %91 = sext <4 x i32> %90 to <4 x i64>
  %92 = extractelement <4 x i64> %91, i64 0
  %93 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %92
  %94 = extractelement <4 x i64> %91, i64 1
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %94
  %96 = extractelement <4 x i64> %91, i64 2
  %97 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %96
  %98 = extractelement <4 x i64> %91, i64 3
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %98
  store i8 %4, i8 addrspace(1)* %93, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %95, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %97, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %99, align 1, !tbaa !16
  %100 = add <4 x i32> %90, %50
  %101 = add nuw i32 %60, 4
  %102 = icmp eq i32 %101, %57
  br i1 %102, label %103, label %58, !llvm.loop !20

103:                                              ; preds = %58, %38
  %104 = phi <4 x i32> [ %47, %38 ], [ %100, %58 ]
  %105 = icmp eq i32 %54, 0
  br i1 %105, label %121, label %106

106:                                              ; preds = %103, %106
  %107 = phi <4 x i32> [ %118, %106 ], [ %104, %103 ]
  %108 = phi i32 [ %119, %106 ], [ 0, %103 ]
  %109 = sext <4 x i32> %107 to <4 x i64>
  %110 = extractelement <4 x i64> %109, i64 0
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %110
  %112 = extractelement <4 x i64> %109, i64 1
  %113 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %112
  %114 = extractelement <4 x i64> %109, i64 2
  %115 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %114
  %116 = extractelement <4 x i64> %109, i64 3
  %117 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %116
  store i8 %4, i8 addrspace(1)* %111, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %113, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %115, align 1, !tbaa !16
  store i8 %4, i8 addrspace(1)* %117, align 1, !tbaa !16
  %118 = add <4 x i32> %107, %50
  %119 = add i32 %108, 1
  %120 = icmp eq i32 %119, %54
  br i1 %120, label %121, label %106, !llvm.loop !23

121:                                              ; preds = %106, %103
  %122 = icmp eq i32 %36, %39
  br i1 %122, label %125, label %123

123:                                              ; preds = %24, %121
  %124 = phi i32 [ %16, %24 ], [ %41, %121 ]
  br label %126

125:                                              ; preds = %126, %121, %3
  ret void

126:                                              ; preds = %123, %126
  %127 = phi i32 [ %130, %126 ], [ %124, %123 ]
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %128
  store i8 %4, i8 addrspace(1)* %129, align 1, !tbaa !16
  %130 = add nsw i32 %127, %22
  %131 = icmp slt i32 %130, %1
  br i1 %131, label %126, label %125, !llvm.loop !25
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!17 = !{!"bool", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21, !22}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!"llvm.loop.isvectorized", i32 1}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !21, !26, !22}
!26 = !{!"llvm.loop.unroll.runtime.disable"}
