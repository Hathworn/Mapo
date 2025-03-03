; ModuleID = '../data/hip_kernels/6580/22/main.cu'
source_filename = "../data/hip_kernels/6580/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24linearLayerUpdateWeightsPfS_S_iiiif(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %4
  %27 = icmp slt i32 %17, %6
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %165

29:                                               ; preds = %8
  %30 = icmp sgt i32 %3, 0
  br i1 %30, label %31, label %60

31:                                               ; preds = %29
  %32 = mul nsw i32 %25, %3
  %33 = mul nsw i32 %17, %5
  %34 = and i32 %3, 7
  %35 = icmp ult i32 %3, 8
  br i1 %35, label %38, label %36

36:                                               ; preds = %31
  %37 = and i32 %3, -8
  br label %71

38:                                               ; preds = %71, %31
  %39 = phi float [ undef, %31 ], [ %161, %71 ]
  %40 = phi i32 [ 0, %31 ], [ %162, %71 ]
  %41 = phi float [ 0.000000e+00, %31 ], [ %161, %71 ]
  %42 = icmp eq i32 %34, 0
  br i1 %42, label %60, label %43

43:                                               ; preds = %38, %43
  %44 = phi i32 [ %57, %43 ], [ %40, %38 ]
  %45 = phi float [ %56, %43 ], [ %41, %38 ]
  %46 = phi i32 [ %58, %43 ], [ 0, %38 ]
  %47 = add nsw i32 %44, %32
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = add nsw i32 %44, %33
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = fmul contract float %50, %54
  %56 = fadd contract float %45, %55
  %57 = add nuw nsw i32 %44, 1
  %58 = add i32 %46, 1
  %59 = icmp eq i32 %58, %34
  br i1 %59, label %60, label %43, !llvm.loop !11

60:                                               ; preds = %38, %43, %29
  %61 = phi float [ 0.000000e+00, %29 ], [ %39, %38 ], [ %56, %43 ]
  %62 = mul nsw i32 %25, %6
  %63 = add nsw i32 %62, %17
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = sitofp i32 %5 to float
  %68 = fdiv contract float %61, %67
  %69 = fmul contract float %68, %7
  %70 = fsub contract float %66, %69
  store float %70, float addrspace(1)* %65, align 4, !tbaa !7
  br label %165

71:                                               ; preds = %71, %36
  %72 = phi i32 [ 0, %36 ], [ %162, %71 ]
  %73 = phi float [ 0.000000e+00, %36 ], [ %161, %71 ]
  %74 = phi i32 [ 0, %36 ], [ %163, %71 ]
  %75 = add nsw i32 %72, %32
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = add nsw i32 %72, %33
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = fmul contract float %78, %82
  %84 = fadd contract float %73, %83
  %85 = or i32 %72, 1
  %86 = add nsw i32 %85, %32
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = add nsw i32 %85, %33
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fmul contract float %89, %93
  %95 = fadd contract float %84, %94
  %96 = or i32 %72, 2
  %97 = add nsw i32 %96, %32
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = add nsw i32 %96, %33
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = fmul contract float %100, %104
  %106 = fadd contract float %95, %105
  %107 = or i32 %72, 3
  %108 = add nsw i32 %107, %32
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = add nsw i32 %107, %33
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = fmul contract float %111, %115
  %117 = fadd contract float %106, %116
  %118 = or i32 %72, 4
  %119 = add nsw i32 %118, %32
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = add nsw i32 %118, %33
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fmul contract float %122, %126
  %128 = fadd contract float %117, %127
  %129 = or i32 %72, 5
  %130 = add nsw i32 %129, %32
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = add nsw i32 %129, %33
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = fmul contract float %133, %137
  %139 = fadd contract float %128, %138
  %140 = or i32 %72, 6
  %141 = add nsw i32 %140, %32
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = add nsw i32 %140, %33
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = fmul contract float %144, %148
  %150 = fadd contract float %139, %149
  %151 = or i32 %72, 7
  %152 = add nsw i32 %151, %32
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = add nsw i32 %151, %33
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %1, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7, !amdgpu.noclobber !5
  %160 = fmul contract float %155, %159
  %161 = fadd contract float %150, %160
  %162 = add nuw nsw i32 %72, 8
  %163 = add i32 %74, 8
  %164 = icmp eq i32 %163, %37
  br i1 %164, label %38, label %71, !llvm.loop !13

165:                                              ; preds = %60, %8
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
