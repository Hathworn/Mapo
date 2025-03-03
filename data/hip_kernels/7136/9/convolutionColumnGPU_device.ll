; ModuleID = '../data/hip_kernels/7136/9/main.cu'
source_filename = "../data/hip_kernels/7136/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20convolutionColumnGPUPfS_S_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %14, %5
  %16 = add i32 %15, %13
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %23, %5
  %25 = add i32 %24, %22
  %26 = shl i32 %5, 1
  %27 = add nsw i32 %26, %3
  %28 = icmp slt i32 %5, 0
  br i1 %28, label %162, label %29

29:                                               ; preds = %6
  %30 = sub nsw i32 0, %5
  %31 = add nuw nsw i32 %26, 1
  %32 = and i32 %31, 7
  br label %33

33:                                               ; preds = %33, %29
  %34 = phi i32 [ %49, %33 ], [ %30, %29 ]
  %35 = phi float [ %48, %33 ], [ 0.000000e+00, %29 ]
  %36 = phi i32 [ %50, %33 ], [ 0, %29 ]
  %37 = add nsw i32 %34, %16
  %38 = mul nsw i32 %37, %27
  %39 = add nsw i32 %38, %25
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = sub nsw i32 %5, %34
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = fmul contract float %42, %46
  %48 = fadd contract float %35, %47
  %49 = add i32 %34, 1
  %50 = add i32 %36, 1
  %51 = icmp eq i32 %50, %32
  br i1 %51, label %52, label %33, !llvm.loop !11

52:                                               ; preds = %33
  %53 = icmp ult i32 %26, 7
  br i1 %53, label %162, label %54

54:                                               ; preds = %52, %54
  %55 = phi i32 [ %160, %54 ], [ %49, %52 ]
  %56 = phi float [ %159, %54 ], [ %48, %52 ]
  %57 = add nsw i32 %55, %16
  %58 = mul nsw i32 %57, %27
  %59 = add nsw i32 %58, %25
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = sub nsw i32 %5, %55
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = fmul contract float %62, %66
  %68 = fadd contract float %56, %67
  %69 = add i32 %55, 1
  %70 = add nsw i32 %69, %16
  %71 = mul nsw i32 %70, %27
  %72 = add nsw i32 %71, %25
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = sub nsw i32 %5, %69
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = fmul contract float %75, %79
  %81 = fadd contract float %68, %80
  %82 = add i32 %55, 2
  %83 = add nsw i32 %82, %16
  %84 = mul nsw i32 %83, %27
  %85 = add nsw i32 %84, %25
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = sub nsw i32 %5, %82
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = fmul contract float %88, %92
  %94 = fadd contract float %81, %93
  %95 = add i32 %55, 3
  %96 = add nsw i32 %95, %16
  %97 = mul nsw i32 %96, %27
  %98 = add nsw i32 %97, %25
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = sub nsw i32 %5, %95
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = fmul contract float %101, %105
  %107 = fadd contract float %94, %106
  %108 = add i32 %55, 4
  %109 = add nsw i32 %108, %16
  %110 = mul nsw i32 %109, %27
  %111 = add nsw i32 %110, %25
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !5
  %115 = sub nsw i32 %5, %108
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = fmul contract float %114, %118
  %120 = fadd contract float %107, %119
  %121 = add i32 %55, 5
  %122 = add nsw i32 %121, %16
  %123 = mul nsw i32 %122, %27
  %124 = add nsw i32 %123, %25
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = sub nsw i32 %5, %121
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %2, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !5
  %132 = fmul contract float %127, %131
  %133 = fadd contract float %120, %132
  %134 = add i32 %55, 6
  %135 = add nsw i32 %134, %16
  %136 = mul nsw i32 %135, %27
  %137 = add nsw i32 %136, %25
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !5
  %141 = sub nsw i32 %5, %134
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %2, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = fmul contract float %140, %144
  %146 = fadd contract float %133, %145
  %147 = add i32 %55, 7
  %148 = add nsw i32 %147, %16
  %149 = mul nsw i32 %148, %27
  %150 = add nsw i32 %149, %25
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %1, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !5
  %154 = sub nsw i32 %5, %147
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %2, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7, !amdgpu.noclobber !5
  %158 = fmul contract float %153, %157
  %159 = fadd contract float %146, %158
  %160 = add i32 %55, 8
  %161 = icmp eq i32 %147, %5
  br i1 %161, label %162, label %54, !llvm.loop !13

162:                                              ; preds = %52, %54, %6
  %163 = phi float [ 0.000000e+00, %6 ], [ %48, %52 ], [ %159, %54 ]
  %164 = mul nsw i32 %16, %27
  %165 = add nsw i32 %164, %25
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %0, i64 %166
  store float %163, float addrspace(1)* %167, align 4, !tbaa !7
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
