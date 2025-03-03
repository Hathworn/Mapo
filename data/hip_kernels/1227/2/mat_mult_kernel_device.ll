; ModuleID = '../data/hip_kernels/1227/2/main.cu'
source_filename = "../data/hip_kernels/1227/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15mat_mult_kernelPiS_S_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !7
  %16 = mul i32 %7, %12
  %17 = add i32 %16, %6
  %18 = icmp slt i32 %17, %3
  br i1 %18, label %19, label %147

19:                                               ; preds = %5
  %20 = icmp sgt i32 %4, 0
  %21 = udiv i32 %15, %12
  %22 = mul i32 %21, %12
  %23 = icmp ugt i32 %15, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %12
  %27 = and i32 %4, 7
  %28 = icmp ult i32 %4, 8
  %29 = and i32 %4, -8
  %30 = icmp eq i32 %27, 0
  br label %31

31:                                               ; preds = %19, %55
  %32 = phi i32 [ %17, %19 ], [ %59, %55 ]
  br i1 %20, label %33, label %55

33:                                               ; preds = %31
  %34 = mul nsw i32 %32, %4
  br i1 %28, label %35, label %61

35:                                               ; preds = %61, %33
  %36 = phi i32 [ undef, %33 ], [ %143, %61 ]
  %37 = phi i32 [ 0, %33 ], [ %144, %61 ]
  %38 = phi i32 [ 0, %33 ], [ %143, %61 ]
  br i1 %30, label %55, label %39

39:                                               ; preds = %35, %39
  %40 = phi i32 [ %52, %39 ], [ %37, %35 ]
  %41 = phi i32 [ %51, %39 ], [ %38, %35 ]
  %42 = phi i32 [ %53, %39 ], [ 0, %35 ]
  %43 = add nsw i32 %40, %34
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !16
  %47 = zext i32 %40 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !16
  %50 = mul nsw i32 %49, %46
  %51 = add nsw i32 %50, %41
  %52 = add nuw nsw i32 %40, 1
  %53 = add i32 %42, 1
  %54 = icmp eq i32 %53, %27
  br i1 %54, label %55, label %39, !llvm.loop !20

55:                                               ; preds = %35, %39, %31
  %56 = phi i32 [ 0, %31 ], [ %36, %35 ], [ %51, %39 ]
  %57 = sext i32 %32 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %57
  store i32 %56, i32 addrspace(1)* %58, align 4, !tbaa !16
  %59 = add i32 %26, %32
  %60 = icmp slt i32 %59, %3
  br i1 %60, label %31, label %147, !llvm.loop !22

61:                                               ; preds = %33, %61
  %62 = phi i32 [ %144, %61 ], [ 0, %33 ]
  %63 = phi i32 [ %143, %61 ], [ 0, %33 ]
  %64 = phi i32 [ %145, %61 ], [ 0, %33 ]
  %65 = add nsw i32 %62, %34
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !16
  %69 = zext i32 %62 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !16
  %72 = mul nsw i32 %71, %68
  %73 = add nsw i32 %72, %63
  %74 = or i32 %62, 1
  %75 = add nsw i32 %74, %34
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !16
  %79 = zext i32 %74 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !16
  %82 = mul nsw i32 %81, %78
  %83 = add nsw i32 %82, %73
  %84 = or i32 %62, 2
  %85 = add nsw i32 %84, %34
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !16
  %89 = zext i32 %84 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !16
  %92 = mul nsw i32 %91, %88
  %93 = add nsw i32 %92, %83
  %94 = or i32 %62, 3
  %95 = add nsw i32 %94, %34
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %96
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !16
  %99 = zext i32 %94 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !16
  %102 = mul nsw i32 %101, %98
  %103 = add nsw i32 %102, %93
  %104 = or i32 %62, 4
  %105 = add nsw i32 %104, %34
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !16
  %109 = zext i32 %104 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !16
  %112 = mul nsw i32 %111, %108
  %113 = add nsw i32 %112, %103
  %114 = or i32 %62, 5
  %115 = add nsw i32 %114, %34
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !16
  %119 = zext i32 %114 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !16
  %122 = mul nsw i32 %121, %118
  %123 = add nsw i32 %122, %113
  %124 = or i32 %62, 6
  %125 = add nsw i32 %124, %34
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %126
  %128 = load i32, i32 addrspace(1)* %127, align 4, !tbaa !16
  %129 = zext i32 %124 to i64
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %129
  %131 = load i32, i32 addrspace(1)* %130, align 4, !tbaa !16
  %132 = mul nsw i32 %131, %128
  %133 = add nsw i32 %132, %123
  %134 = or i32 %62, 7
  %135 = add nsw i32 %134, %34
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %136
  %138 = load i32, i32 addrspace(1)* %137, align 4, !tbaa !16
  %139 = zext i32 %134 to i64
  %140 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %139
  %141 = load i32, i32 addrspace(1)* %140, align 4, !tbaa !16
  %142 = mul nsw i32 %141, %138
  %143 = add nsw i32 %142, %133
  %144 = add nuw nsw i32 %62, 8
  %145 = add i32 %64, 8
  %146 = icmp eq i32 %145, %29
  br i1 %146, label %35, label %61, !llvm.loop !24

147:                                              ; preds = %55, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
