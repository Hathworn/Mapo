; ModuleID = '../data/hip_kernels/8873/0/main.cu'
source_filename = "../data/hip_kernels/8873/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11cacheMatmulPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %20 = add i32 %18, %19
  %21 = icmp sgt i32 %3, 0
  br i1 %21, label %22, label %42

22:                                               ; preds = %4
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = mul i32 %23, %9
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %25
  %27 = mul nsw i32 %26, %3
  %28 = add nsw i32 %20, %27
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  %31 = udiv i32 %12, %9
  %32 = mul i32 %31, %9
  %33 = icmp ugt i32 %12, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = load float, float addrspace(1)* %30, align 4, !tbaa !16
  %37 = add i32 %31, %34
  %38 = add i32 %37, -1
  %39 = and i32 %35, 7
  %40 = icmp eq i32 %39, 0
  %41 = icmp ult i32 %38, 7
  br label %43

42:                                               ; preds = %73, %4
  ret void

43:                                               ; preds = %22, %73
  %44 = phi float [ %36, %22 ], [ %74, %73 ]
  %45 = phi i32 [ %35, %22 ], [ %76, %73 ]
  %46 = phi i32 [ 0, %22 ], [ %48, %73 ]
  %47 = add i32 %31, %46
  %48 = add i32 %47, %34
  %49 = icmp ult i32 %46, %48
  br i1 %49, label %50, label %73

50:                                               ; preds = %43
  br i1 %40, label %69, label %51

51:                                               ; preds = %50, %51
  %52 = phi i32 [ %66, %51 ], [ %46, %50 ]
  %53 = phi float [ %65, %51 ], [ %44, %50 ]
  %54 = phi i32 [ %67, %51 ], [ 0, %50 ]
  %55 = add nsw i32 %52, %27
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %59 = mul nsw i32 %52, %3
  %60 = add nsw i32 %59, %20
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !16
  %64 = fmul contract float %58, %63
  %65 = fadd contract float %53, %64
  %66 = add nuw nsw i32 %52, 1
  %67 = add i32 %54, 1
  %68 = icmp eq i32 %67, %39
  br i1 %68, label %69, label %51, !llvm.loop !20

69:                                               ; preds = %51, %50
  %70 = phi float [ undef, %50 ], [ %65, %51 ]
  %71 = phi i32 [ %46, %50 ], [ %66, %51 ]
  %72 = phi float [ %44, %50 ], [ %65, %51 ]
  br i1 %41, label %73, label %77

73:                                               ; preds = %69, %77, %43
  %74 = phi float [ %44, %43 ], [ %70, %69 ], [ %174, %77 ]
  store float %74, float addrspace(1)* %30, align 4, !tbaa !16
  %75 = icmp slt i32 %48, %3
  %76 = add i32 %45, %35
  br i1 %75, label %43, label %42, !llvm.loop !22

77:                                               ; preds = %69, %77
  %78 = phi i32 [ %175, %77 ], [ %71, %69 ]
  %79 = phi float [ %174, %77 ], [ %72, %69 ]
  %80 = add nsw i32 %78, %27
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16
  %84 = mul nsw i32 %78, %3
  %85 = add nsw i32 %84, %20
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = fmul contract float %83, %88
  %90 = fadd contract float %79, %89
  %91 = add nuw nsw i32 %78, 1
  %92 = add nsw i32 %91, %27
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %96 = mul nsw i32 %91, %3
  %97 = add nsw i32 %96, %20
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  %101 = fmul contract float %95, %100
  %102 = fadd contract float %90, %101
  %103 = add nuw nsw i32 %78, 2
  %104 = add nsw i32 %103, %27
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %108 = mul nsw i32 %103, %3
  %109 = add nsw i32 %108, %20
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !16
  %113 = fmul contract float %107, %112
  %114 = fadd contract float %102, %113
  %115 = add nuw nsw i32 %78, 3
  %116 = add nsw i32 %115, %27
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16
  %120 = mul nsw i32 %115, %3
  %121 = add nsw i32 %120, %20
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !16
  %125 = fmul contract float %119, %124
  %126 = fadd contract float %114, %125
  %127 = add nuw nsw i32 %78, 4
  %128 = add nsw i32 %127, %27
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !16
  %132 = mul nsw i32 %127, %3
  %133 = add nsw i32 %132, %20
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !16
  %137 = fmul contract float %131, %136
  %138 = fadd contract float %126, %137
  %139 = add nuw nsw i32 %78, 5
  %140 = add nsw i32 %139, %27
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !16
  %144 = mul nsw i32 %139, %3
  %145 = add nsw i32 %144, %20
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !16
  %149 = fmul contract float %143, %148
  %150 = fadd contract float %138, %149
  %151 = add nuw nsw i32 %78, 6
  %152 = add nsw i32 %151, %27
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !16
  %156 = mul nsw i32 %151, %3
  %157 = add nsw i32 %156, %20
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !16
  %161 = fmul contract float %155, %160
  %162 = fadd contract float %150, %161
  %163 = add nuw nsw i32 %78, 7
  %164 = add nsw i32 %163, %27
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %0, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !16
  %168 = mul nsw i32 %163, %3
  %169 = add nsw i32 %168, %20
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %1, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !16
  %173 = fmul contract float %167, %172
  %174 = fadd contract float %162, %173
  %175 = add nuw nsw i32 %78, 8
  %176 = icmp eq i32 %175, %45
  br i1 %176, label %73, label %77, !llvm.loop !24
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
