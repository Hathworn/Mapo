; ModuleID = '../data/hip_kernels/4199/2/main.cu'
source_filename = "../data/hip_kernels/4199/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21matrix_matrix_mul_oldPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !7
  %17 = mul i32 %8, %13
  %18 = add i32 %17, %7
  %19 = icmp slt i32 %18, %3
  br i1 %19, label %20, label %175

20:                                               ; preds = %6
  %21 = icmp sgt i32 %4, 0
  %22 = icmp sgt i32 %5, 0
  %23 = udiv i32 %16, %13
  %24 = mul i32 %23, %13
  %25 = icmp ugt i32 %16, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %13
  %29 = and i32 %5, 7
  %30 = icmp ult i32 %5, 8
  %31 = and i32 %5, -8
  %32 = icmp eq i32 %29, 0
  br label %33

33:                                               ; preds = %20, %41
  %34 = phi i32 [ %18, %20 ], [ %42, %41 ]
  br i1 %21, label %35, label %41

35:                                               ; preds = %33
  %36 = mul nsw i32 %34, %5
  %37 = mul nsw i32 %34, %4
  br label %38

38:                                               ; preds = %35, %66
  %39 = phi i32 [ 0, %35 ], [ %71, %66 ]
  br i1 %22, label %40, label %66

40:                                               ; preds = %38
  br i1 %30, label %44, label %73

41:                                               ; preds = %66, %33
  %42 = add i32 %28, %34
  %43 = icmp slt i32 %42, %3
  br i1 %43, label %33, label %175, !llvm.loop !16

44:                                               ; preds = %73, %40
  %45 = phi i32 [ undef, %40 ], [ %171, %73 ]
  %46 = phi i32 [ 0, %40 ], [ %172, %73 ]
  %47 = phi i32 [ 0, %40 ], [ %171, %73 ]
  br i1 %32, label %66, label %48

48:                                               ; preds = %44, %48
  %49 = phi i32 [ %63, %48 ], [ %46, %44 ]
  %50 = phi i32 [ %62, %48 ], [ %47, %44 ]
  %51 = phi i32 [ %64, %48 ], [ 0, %44 ]
  %52 = add nsw i32 %49, %36
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !18
  %56 = mul nsw i32 %49, %4
  %57 = add nsw i32 %56, %39
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !18
  %61 = mul nsw i32 %60, %55
  %62 = add nsw i32 %61, %50
  %63 = add nuw nsw i32 %49, 1
  %64 = add i32 %51, 1
  %65 = icmp eq i32 %64, %29
  br i1 %65, label %66, label %48, !llvm.loop !22

66:                                               ; preds = %44, %48, %38
  %67 = phi i32 [ 0, %38 ], [ %45, %44 ], [ %62, %48 ]
  %68 = add nsw i32 %39, %37
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %69
  store i32 %67, i32 addrspace(1)* %70, align 4, !tbaa !18
  %71 = add nuw nsw i32 %39, 1
  %72 = icmp eq i32 %71, %4
  br i1 %72, label %41, label %38, !llvm.loop !24

73:                                               ; preds = %40, %73
  %74 = phi i32 [ %172, %73 ], [ 0, %40 ]
  %75 = phi i32 [ %171, %73 ], [ 0, %40 ]
  %76 = phi i32 [ %173, %73 ], [ 0, %40 ]
  %77 = add nsw i32 %74, %36
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !18
  %81 = mul nsw i32 %74, %4
  %82 = add nsw i32 %81, %39
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !18
  %86 = mul nsw i32 %85, %80
  %87 = add nsw i32 %86, %75
  %88 = or i32 %74, 1
  %89 = add nsw i32 %88, %36
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !18
  %93 = mul nsw i32 %88, %4
  %94 = add nsw i32 %93, %39
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !18
  %98 = mul nsw i32 %97, %92
  %99 = add nsw i32 %98, %87
  %100 = or i32 %74, 2
  %101 = add nsw i32 %100, %36
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %102
  %104 = load i32, i32 addrspace(1)* %103, align 4, !tbaa !18
  %105 = mul nsw i32 %100, %4
  %106 = add nsw i32 %105, %39
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !18
  %110 = mul nsw i32 %109, %104
  %111 = add nsw i32 %110, %99
  %112 = or i32 %74, 3
  %113 = add nsw i32 %112, %36
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !18
  %117 = mul nsw i32 %112, %4
  %118 = add nsw i32 %117, %39
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !18
  %122 = mul nsw i32 %121, %116
  %123 = add nsw i32 %122, %111
  %124 = or i32 %74, 4
  %125 = add nsw i32 %124, %36
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %126
  %128 = load i32, i32 addrspace(1)* %127, align 4, !tbaa !18
  %129 = mul nsw i32 %124, %4
  %130 = add nsw i32 %129, %39
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %131
  %133 = load i32, i32 addrspace(1)* %132, align 4, !tbaa !18
  %134 = mul nsw i32 %133, %128
  %135 = add nsw i32 %134, %123
  %136 = or i32 %74, 5
  %137 = add nsw i32 %136, %36
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %138
  %140 = load i32, i32 addrspace(1)* %139, align 4, !tbaa !18
  %141 = mul nsw i32 %136, %4
  %142 = add nsw i32 %141, %39
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %143
  %145 = load i32, i32 addrspace(1)* %144, align 4, !tbaa !18
  %146 = mul nsw i32 %145, %140
  %147 = add nsw i32 %146, %135
  %148 = or i32 %74, 6
  %149 = add nsw i32 %148, %36
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %150
  %152 = load i32, i32 addrspace(1)* %151, align 4, !tbaa !18
  %153 = mul nsw i32 %148, %4
  %154 = add nsw i32 %153, %39
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %155
  %157 = load i32, i32 addrspace(1)* %156, align 4, !tbaa !18
  %158 = mul nsw i32 %157, %152
  %159 = add nsw i32 %158, %147
  %160 = or i32 %74, 7
  %161 = add nsw i32 %160, %36
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %162
  %164 = load i32, i32 addrspace(1)* %163, align 4, !tbaa !18
  %165 = mul nsw i32 %160, %4
  %166 = add nsw i32 %165, %39
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %167
  %169 = load i32, i32 addrspace(1)* %168, align 4, !tbaa !18
  %170 = mul nsw i32 %169, %164
  %171 = add nsw i32 %170, %159
  %172 = add nuw nsw i32 %74, 8
  %173 = add i32 %76, 8
  %174 = icmp eq i32 %173, %31
  br i1 %174, label %44, label %73, !llvm.loop !25

175:                                              ; preds = %41, %6
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
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !17}
!25 = distinct !{!25, !17}
