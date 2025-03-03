; ModuleID = '../data/hip_kernels/2766/5/main.cu'
source_filename = "../data/hip_kernels/2766/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z32cudaUpdateBatchFiringRate_kernelPjS_jjjj(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = icmp ult i32 %7, %4
  br i1 %8, label %9, label %39

9:                                                ; preds = %6
  %10 = icmp eq i32 %3, 0
  %11 = icmp eq i32 %2, 0
  %12 = icmp eq i32 %5, 0
  %13 = mul i32 %3, %2
  %14 = mul i32 %13, %4
  %15 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !4
  %23 = load i16, i16 addrspace(4)* %17, align 4, !range !13, !invariant.load !14
  %24 = zext i16 %23 to i32
  %25 = udiv i32 %22, %24
  %26 = mul i32 %25, %24
  %27 = icmp ugt i32 %22, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %5, 7
  %30 = icmp ult i32 %5, 8
  %31 = and i32 %5, -8
  %32 = icmp eq i32 %29, 0
  br label %33

33:                                               ; preds = %9, %45
  %34 = phi i32 [ %7, %9 ], [ %47, %45 ]
  br i1 %10, label %45, label %35

35:                                               ; preds = %33
  %36 = mul i32 %34, %3
  %37 = load i16, i16 addrspace(4)* %19, align 2, !range !13, !invariant.load !14
  %38 = zext i16 %37 to i32
  br label %40

39:                                               ; preds = %45, %6
  ret void

40:                                               ; preds = %35, %49
  %41 = phi i32 [ 0, %35 ], [ %50, %49 ]
  br i1 %11, label %49, label %42

42:                                               ; preds = %40
  %43 = add i32 %41, %36
  %44 = mul i32 %43, %2
  br label %52

45:                                               ; preds = %49, %33
  %46 = add i32 %25, %34
  %47 = add i32 %46, %28
  %48 = icmp ult i32 %47, %4
  br i1 %48, label %33, label %39, !llvm.loop !15

49:                                               ; preds = %73, %40
  %50 = add i32 %41, %38
  %51 = icmp ult i32 %50, %3
  br i1 %51, label %40, label %45, !llvm.loop !17

52:                                               ; preds = %42, %73
  %53 = phi i32 [ 0, %42 ], [ %77, %73 ]
  %54 = add i32 %53, %44
  br i1 %12, label %73, label %55

55:                                               ; preds = %52
  br i1 %30, label %56, label %79

56:                                               ; preds = %79, %55
  %57 = phi i32 [ undef, %55 ], [ %137, %79 ]
  %58 = phi i32 [ 0, %55 ], [ %138, %79 ]
  %59 = phi i32 [ 0, %55 ], [ %137, %79 ]
  br i1 %32, label %73, label %60

60:                                               ; preds = %56, %60
  %61 = phi i32 [ %70, %60 ], [ %58, %56 ]
  %62 = phi i32 [ %69, %60 ], [ %59, %56 ]
  %63 = phi i32 [ %71, %60 ], [ 0, %56 ]
  %64 = mul i32 %14, %61
  %65 = add i32 %64, %54
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !18
  %69 = add i32 %68, %62
  %70 = add nuw i32 %61, 1
  %71 = add i32 %63, 1
  %72 = icmp eq i32 %71, %29
  br i1 %72, label %73, label %60, !llvm.loop !22

73:                                               ; preds = %56, %60, %52
  %74 = phi i32 [ 0, %52 ], [ %57, %56 ], [ %69, %60 ]
  %75 = zext i32 %54 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %75
  store i32 %74, i32 addrspace(1)* %76, align 4, !tbaa !18
  %77 = add i32 %53, %24
  %78 = icmp ult i32 %77, %2
  br i1 %78, label %52, label %49, !llvm.loop !24

79:                                               ; preds = %55, %79
  %80 = phi i32 [ %138, %79 ], [ 0, %55 ]
  %81 = phi i32 [ %137, %79 ], [ 0, %55 ]
  %82 = phi i32 [ %139, %79 ], [ 0, %55 ]
  %83 = mul i32 %14, %80
  %84 = add i32 %83, %54
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !18
  %88 = add i32 %87, %81
  %89 = or i32 %80, 1
  %90 = mul i32 %14, %89
  %91 = add i32 %90, %54
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !18
  %95 = add i32 %94, %88
  %96 = or i32 %80, 2
  %97 = mul i32 %14, %96
  %98 = add i32 %97, %54
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !18
  %102 = add i32 %101, %95
  %103 = or i32 %80, 3
  %104 = mul i32 %14, %103
  %105 = add i32 %104, %54
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !18
  %109 = add i32 %108, %102
  %110 = or i32 %80, 4
  %111 = mul i32 %14, %110
  %112 = add i32 %111, %54
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %113
  %115 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !18
  %116 = add i32 %115, %109
  %117 = or i32 %80, 5
  %118 = mul i32 %14, %117
  %119 = add i32 %118, %54
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %120
  %122 = load i32, i32 addrspace(1)* %121, align 4, !tbaa !18
  %123 = add i32 %122, %116
  %124 = or i32 %80, 6
  %125 = mul i32 %14, %124
  %126 = add i32 %125, %54
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %127
  %129 = load i32, i32 addrspace(1)* %128, align 4, !tbaa !18
  %130 = add i32 %129, %123
  %131 = or i32 %80, 7
  %132 = mul i32 %14, %131
  %133 = add i32 %132, %54
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %134
  %136 = load i32, i32 addrspace(1)* %135, align 4, !tbaa !18
  %137 = add i32 %136, %130
  %138 = add nuw i32 %80, 8
  %139 = add i32 %82, 8
  %140 = icmp eq i32 %139, %31
  br i1 %140, label %56, label %79, !llvm.loop !25
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !16}
!25 = distinct !{!25, !16}
