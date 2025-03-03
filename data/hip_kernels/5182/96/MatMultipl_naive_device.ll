; ModuleID = '../data/hip_kernels/5182/96/main.cu'
source_filename = "../data/hip_kernels/5182/96/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16MatMultipl_naivePfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %23, %4
  %25 = add nsw i32 %24, %15
  %26 = icmp slt i32 %25, %5
  br i1 %26, label %27, label %164

27:                                               ; preds = %6
  %28 = icmp sgt i32 %3, 0
  br i1 %28, label %29, label %58

29:                                               ; preds = %27
  %30 = mul nsw i32 %23, %3
  %31 = and i32 %3, 7
  %32 = icmp ult i32 %3, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = and i32 %3, -8
  br label %62

35:                                               ; preds = %62, %29
  %36 = phi float [ undef, %29 ], [ %160, %62 ]
  %37 = phi i32 [ 0, %29 ], [ %161, %62 ]
  %38 = phi float [ 0.000000e+00, %29 ], [ %160, %62 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %58, label %40

40:                                               ; preds = %35, %40
  %41 = phi i32 [ %55, %40 ], [ %37, %35 ]
  %42 = phi float [ %54, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %56, %40 ], [ 0, %35 ]
  %44 = add nsw i32 %41, %30
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = mul nsw i32 %41, %4
  %49 = add nsw i32 %48, %15
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = fmul contract float %47, %52
  %54 = fadd contract float %42, %53
  %55 = add nuw nsw i32 %41, 1
  %56 = add i32 %43, 1
  %57 = icmp eq i32 %56, %31
  br i1 %57, label %58, label %40, !llvm.loop !11

58:                                               ; preds = %35, %40, %27
  %59 = phi float [ 0.000000e+00, %27 ], [ %36, %35 ], [ %54, %40 ]
  %60 = sext i32 %25 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  store float %59, float addrspace(1)* %61, align 4, !tbaa !7
  br label %164

62:                                               ; preds = %62, %33
  %63 = phi i32 [ 0, %33 ], [ %161, %62 ]
  %64 = phi float [ 0.000000e+00, %33 ], [ %160, %62 ]
  %65 = phi i32 [ 0, %33 ], [ %162, %62 ]
  %66 = add nsw i32 %63, %30
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = mul nsw i32 %63, %4
  %71 = add nsw i32 %70, %15
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = fmul contract float %69, %74
  %76 = fadd contract float %64, %75
  %77 = or i32 %63, 1
  %78 = add nsw i32 %77, %30
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = mul nsw i32 %77, %4
  %83 = add nsw i32 %82, %15
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = fmul contract float %81, %86
  %88 = fadd contract float %76, %87
  %89 = or i32 %63, 2
  %90 = add nsw i32 %89, %30
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = mul nsw i32 %89, %4
  %95 = add nsw i32 %94, %15
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = fmul contract float %93, %98
  %100 = fadd contract float %88, %99
  %101 = or i32 %63, 3
  %102 = add nsw i32 %101, %30
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = mul nsw i32 %101, %4
  %107 = add nsw i32 %106, %15
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = fmul contract float %105, %110
  %112 = fadd contract float %100, %111
  %113 = or i32 %63, 4
  %114 = add nsw i32 %113, %30
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = mul nsw i32 %113, %4
  %119 = add nsw i32 %118, %15
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = fmul contract float %117, %122
  %124 = fadd contract float %112, %123
  %125 = or i32 %63, 5
  %126 = add nsw i32 %125, %30
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !5
  %130 = mul nsw i32 %125, %4
  %131 = add nsw i32 %130, %15
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !5
  %135 = fmul contract float %129, %134
  %136 = fadd contract float %124, %135
  %137 = or i32 %63, 6
  %138 = add nsw i32 %137, %30
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %0, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7, !amdgpu.noclobber !5
  %142 = mul nsw i32 %137, %4
  %143 = add nsw i32 %142, %15
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !5
  %147 = fmul contract float %141, %146
  %148 = fadd contract float %136, %147
  %149 = or i32 %63, 7
  %150 = add nsw i32 %149, %30
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !5
  %154 = mul nsw i32 %149, %4
  %155 = add nsw i32 %154, %15
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %1, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !5
  %159 = fmul contract float %153, %158
  %160 = fadd contract float %148, %159
  %161 = add nuw nsw i32 %63, 8
  %162 = add i32 %65, 8
  %163 = icmp eq i32 %162, %34
  br i1 %163, label %35, label %62, !llvm.loop !13

164:                                              ; preds = %58, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
