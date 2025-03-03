; ModuleID = '../data/hip_kernels/17752/7/main.cu'
source_filename = "../data/hip_kernels/17752/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6kerneliiiPfS_Pi(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %1
  br i1 %16, label %17, label %169

17:                                               ; preds = %6
  %18 = icmp sgt i32 %2, 0
  br i1 %18, label %19, label %32

19:                                               ; preds = %17
  %20 = icmp sgt i32 %0, 0
  %21 = mul nsw i32 %15, %0
  %22 = and i32 %0, 7
  %23 = icmp ult i32 %0, 8
  %24 = and i32 %0, -8
  %25 = icmp eq i32 %22, 0
  br label %26

26:                                               ; preds = %19, %58
  %27 = phi i32 [ 0, %19 ], [ %65, %58 ]
  %28 = phi i32 [ undef, %19 ], [ %64, %58 ]
  %29 = phi float [ -1.000000e+00, %19 ], [ %63, %58 ]
  br i1 %20, label %30, label %58

30:                                               ; preds = %26
  %31 = mul nsw i32 %27, %0
  br i1 %23, label %36, label %67

32:                                               ; preds = %58, %17
  %33 = phi i32 [ undef, %17 ], [ %64, %58 ]
  %34 = sext i32 %15 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %34
  store i32 %33, i32 addrspace(1)* %35, align 4, !tbaa !7
  br label %169

36:                                               ; preds = %67, %30
  %37 = phi float [ undef, %30 ], [ %165, %67 ]
  %38 = phi i32 [ 0, %30 ], [ %166, %67 ]
  %39 = phi float [ 0.000000e+00, %30 ], [ %165, %67 ]
  br i1 %25, label %58, label %40

40:                                               ; preds = %36, %40
  %41 = phi i32 [ %55, %40 ], [ %38, %36 ]
  %42 = phi float [ %54, %40 ], [ %39, %36 ]
  %43 = phi i32 [ %56, %40 ], [ 0, %36 ]
  %44 = add nsw i32 %41, %21
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %3, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !11, !amdgpu.noclobber !5
  %48 = add nsw i32 %41, %31
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %4, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !11, !amdgpu.noclobber !5
  %52 = fsub contract float %47, %51
  %53 = fmul contract float %52, %52
  %54 = fadd contract float %42, %53
  %55 = add nuw nsw i32 %41, 1
  %56 = add i32 %43, 1
  %57 = icmp eq i32 %56, %22
  br i1 %57, label %58, label %40, !llvm.loop !13

58:                                               ; preds = %36, %40, %26
  %59 = phi float [ 0.000000e+00, %26 ], [ %37, %36 ], [ %54, %40 ]
  %60 = fcmp contract olt float %29, 0.000000e+00
  %61 = fcmp contract olt float %59, %29
  %62 = select i1 %60, i1 true, i1 %61
  %63 = select i1 %62, float %59, float %29
  %64 = select i1 %62, i32 %27, i32 %28
  %65 = add nuw nsw i32 %27, 1
  %66 = icmp eq i32 %65, %2
  br i1 %66, label %32, label %26, !llvm.loop !15

67:                                               ; preds = %30, %67
  %68 = phi i32 [ %166, %67 ], [ 0, %30 ]
  %69 = phi float [ %165, %67 ], [ 0.000000e+00, %30 ]
  %70 = phi i32 [ %167, %67 ], [ 0, %30 ]
  %71 = add nsw i32 %68, %21
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %3, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !11, !amdgpu.noclobber !5
  %75 = add nsw i32 %68, %31
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %4, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !11, !amdgpu.noclobber !5
  %79 = fsub contract float %74, %78
  %80 = fmul contract float %79, %79
  %81 = fadd contract float %69, %80
  %82 = or i32 %68, 1
  %83 = add nsw i32 %82, %21
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %3, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !11, !amdgpu.noclobber !5
  %87 = add nsw i32 %82, %31
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %4, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !11, !amdgpu.noclobber !5
  %91 = fsub contract float %86, %90
  %92 = fmul contract float %91, %91
  %93 = fadd contract float %81, %92
  %94 = or i32 %68, 2
  %95 = add nsw i32 %94, %21
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %3, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !11, !amdgpu.noclobber !5
  %99 = add nsw i32 %94, %31
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %4, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !11, !amdgpu.noclobber !5
  %103 = fsub contract float %98, %102
  %104 = fmul contract float %103, %103
  %105 = fadd contract float %93, %104
  %106 = or i32 %68, 3
  %107 = add nsw i32 %106, %21
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %3, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !11, !amdgpu.noclobber !5
  %111 = add nsw i32 %106, %31
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %4, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !11, !amdgpu.noclobber !5
  %115 = fsub contract float %110, %114
  %116 = fmul contract float %115, %115
  %117 = fadd contract float %105, %116
  %118 = or i32 %68, 4
  %119 = add nsw i32 %118, %21
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %3, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !11, !amdgpu.noclobber !5
  %123 = add nsw i32 %118, %31
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %4, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !11, !amdgpu.noclobber !5
  %127 = fsub contract float %122, %126
  %128 = fmul contract float %127, %127
  %129 = fadd contract float %117, %128
  %130 = or i32 %68, 5
  %131 = add nsw i32 %130, %21
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %3, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !11, !amdgpu.noclobber !5
  %135 = add nsw i32 %130, %31
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %4, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !11, !amdgpu.noclobber !5
  %139 = fsub contract float %134, %138
  %140 = fmul contract float %139, %139
  %141 = fadd contract float %129, %140
  %142 = or i32 %68, 6
  %143 = add nsw i32 %142, %21
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %3, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !11, !amdgpu.noclobber !5
  %147 = add nsw i32 %142, %31
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %4, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !11, !amdgpu.noclobber !5
  %151 = fsub contract float %146, %150
  %152 = fmul contract float %151, %151
  %153 = fadd contract float %141, %152
  %154 = or i32 %68, 7
  %155 = add nsw i32 %154, %21
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %3, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !11, !amdgpu.noclobber !5
  %159 = add nsw i32 %154, %31
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %4, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !11, !amdgpu.noclobber !5
  %163 = fsub contract float %158, %162
  %164 = fmul contract float %163, %163
  %165 = fadd contract float %153, %164
  %166 = add nuw nsw i32 %68, 8
  %167 = add i32 %70, 8
  %168 = icmp eq i32 %167, %24
  br i1 %168, label %36, label %67, !llvm.loop !17

169:                                              ; preds = %32, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
