; ModuleID = '../data/hip_kernels/3025/6/main.cu'
source_filename = "../data/hip_kernels/3025/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15multiplyVectorsPfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp slt i32 %14, %3
  %24 = icmp slt i32 %22, %4
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %176

26:                                               ; preds = %5
  %27 = icmp sgt i32 %3, 0
  %28 = mul nsw i32 %22, %3
  br i1 %27, label %29, label %61

29:                                               ; preds = %26
  %30 = and i32 %3, 7
  %31 = icmp ult i32 %3, 8
  br i1 %31, label %34, label %32

32:                                               ; preds = %29
  %33 = and i32 %3, -8
  br label %66

34:                                               ; preds = %66, %29
  %35 = phi double [ undef, %29 ], [ %172, %66 ]
  %36 = phi i32 [ 0, %29 ], [ %173, %66 ]
  %37 = phi double [ 0.000000e+00, %29 ], [ %172, %66 ]
  %38 = icmp eq i32 %30, 0
  br i1 %38, label %58, label %39

39:                                               ; preds = %34, %39
  %40 = phi i32 [ %55, %39 ], [ %36, %34 ]
  %41 = phi double [ %54, %39 ], [ %37, %34 ]
  %42 = phi i32 [ %56, %39 ], [ 0, %34 ]
  %43 = add nsw i32 %40, %28
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = mul nsw i32 %40, %3
  %48 = add nsw i32 %47, %14
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !6
  %52 = fmul contract float %46, %51
  %53 = fpext float %52 to double
  %54 = fadd contract double %41, %53
  %55 = add nuw nsw i32 %40, 1
  %56 = add i32 %42, 1
  %57 = icmp eq i32 %56, %30
  br i1 %57, label %58, label %39, !llvm.loop !11

58:                                               ; preds = %39, %34
  %59 = phi double [ %35, %34 ], [ %54, %39 ]
  %60 = fptrunc double %59 to float
  br label %61

61:                                               ; preds = %26, %58
  %62 = phi float [ %60, %58 ], [ 0.000000e+00, %26 ]
  %63 = add nsw i32 %28, %14
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  store float %62, float addrspace(1)* %65, align 4, !tbaa !7
  br label %176

66:                                               ; preds = %66, %32
  %67 = phi i32 [ 0, %32 ], [ %173, %66 ]
  %68 = phi double [ 0.000000e+00, %32 ], [ %172, %66 ]
  %69 = phi i32 [ 0, %32 ], [ %174, %66 ]
  %70 = add nsw i32 %67, %28
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !6
  %74 = mul nsw i32 %67, %3
  %75 = add nsw i32 %74, %14
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !6
  %79 = fmul contract float %73, %78
  %80 = fpext float %79 to double
  %81 = fadd contract double %68, %80
  %82 = or i32 %67, 1
  %83 = add nsw i32 %82, %28
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %87 = mul nsw i32 %82, %3
  %88 = add nsw i32 %87, %14
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !6
  %92 = fmul contract float %86, %91
  %93 = fpext float %92 to double
  %94 = fadd contract double %81, %93
  %95 = or i32 %67, 2
  %96 = add nsw i32 %95, %28
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !6
  %100 = mul nsw i32 %95, %3
  %101 = add nsw i32 %100, %14
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !6
  %105 = fmul contract float %99, %104
  %106 = fpext float %105 to double
  %107 = fadd contract double %94, %106
  %108 = or i32 %67, 3
  %109 = add nsw i32 %108, %28
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !6
  %113 = mul nsw i32 %108, %3
  %114 = add nsw i32 %113, %14
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !6
  %118 = fmul contract float %112, %117
  %119 = fpext float %118 to double
  %120 = fadd contract double %107, %119
  %121 = or i32 %67, 4
  %122 = add nsw i32 %121, %28
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !6
  %126 = mul nsw i32 %121, %3
  %127 = add nsw i32 %126, %14
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !6
  %131 = fmul contract float %125, %130
  %132 = fpext float %131 to double
  %133 = fadd contract double %120, %132
  %134 = or i32 %67, 5
  %135 = add nsw i32 %134, %28
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !6
  %139 = mul nsw i32 %134, %3
  %140 = add nsw i32 %139, %14
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %1, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !6
  %144 = fmul contract float %138, %143
  %145 = fpext float %144 to double
  %146 = fadd contract double %133, %145
  %147 = or i32 %67, 6
  %148 = add nsw i32 %147, %28
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !6
  %152 = mul nsw i32 %147, %3
  %153 = add nsw i32 %152, %14
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %1, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7, !amdgpu.noclobber !6
  %157 = fmul contract float %151, %156
  %158 = fpext float %157 to double
  %159 = fadd contract double %146, %158
  %160 = or i32 %67, 7
  %161 = add nsw i32 %160, %28
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7, !amdgpu.noclobber !6
  %165 = mul nsw i32 %160, %3
  %166 = add nsw i32 %165, %14
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %1, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7, !amdgpu.noclobber !6
  %170 = fmul contract float %164, %169
  %171 = fpext float %170 to double
  %172 = fadd contract double %159, %171
  %173 = add nuw nsw i32 %67, 8
  %174 = add i32 %69, 8
  %175 = icmp eq i32 %174, %33
  br i1 %175, label %34, label %66, !llvm.loop !13

176:                                              ; preds = %61, %5
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
