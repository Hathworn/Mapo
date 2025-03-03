; ModuleID = '../data/hip_kernels/2171/1/main.cu'
source_filename = "../data/hip_kernels/2171/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15gpu_matrix_multPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %23, %5
  %25 = icmp slt i32 %15, %3
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %187

27:                                               ; preds = %6
  %28 = icmp sgt i32 %4, 0
  br i1 %28, label %29, label %63

29:                                               ; preds = %27
  %30 = mul nsw i32 %15, %4
  %31 = and i32 %4, 7
  %32 = icmp ult i32 %4, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = and i32 %4, -8
  br label %69

35:                                               ; preds = %69, %29
  %36 = phi i32 [ undef, %29 ], [ %183, %69 ]
  %37 = phi i32 [ 0, %29 ], [ %184, %69 ]
  %38 = phi i32 [ 0, %29 ], [ %183, %69 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %60, label %40

40:                                               ; preds = %35, %40
  %41 = phi i32 [ %57, %40 ], [ %37, %35 ]
  %42 = phi i32 [ %56, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %58, %40 ], [ 0, %35 ]
  %44 = add nsw i32 %41, %30
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = mul nsw i32 %41, %5
  %49 = add nsw i32 %48, %23
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = fmul contract float %47, %52
  %54 = sitofp i32 %42 to float
  %55 = fadd contract float %53, %54
  %56 = fptosi float %55 to i32
  %57 = add nuw nsw i32 %41, 1
  %58 = add i32 %43, 1
  %59 = icmp eq i32 %58, %31
  br i1 %59, label %60, label %40, !llvm.loop !11

60:                                               ; preds = %40, %35
  %61 = phi i32 [ %36, %35 ], [ %56, %40 ]
  %62 = sitofp i32 %61 to float
  br label %63

63:                                               ; preds = %60, %27
  %64 = phi float [ 0.000000e+00, %27 ], [ %62, %60 ]
  %65 = mul nsw i32 %15, %5
  %66 = add nsw i32 %65, %23
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %2, i64 %67
  store float %64, float addrspace(1)* %68, align 4, !tbaa !7
  br label %187

69:                                               ; preds = %69, %33
  %70 = phi i32 [ 0, %33 ], [ %184, %69 ]
  %71 = phi i32 [ 0, %33 ], [ %183, %69 ]
  %72 = phi i32 [ 0, %33 ], [ %185, %69 ]
  %73 = add nsw i32 %70, %30
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = mul nsw i32 %70, %5
  %78 = add nsw i32 %77, %23
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = fmul contract float %76, %81
  %83 = sitofp i32 %71 to float
  %84 = fadd contract float %82, %83
  %85 = fptosi float %84 to i32
  %86 = or i32 %70, 1
  %87 = add nsw i32 %86, %30
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = mul nsw i32 %86, %5
  %92 = add nsw i32 %91, %23
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = fmul contract float %90, %95
  %97 = sitofp i32 %85 to float
  %98 = fadd contract float %96, %97
  %99 = fptosi float %98 to i32
  %100 = or i32 %70, 2
  %101 = add nsw i32 %100, %30
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = mul nsw i32 %100, %5
  %106 = add nsw i32 %105, %23
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = fmul contract float %104, %109
  %111 = sitofp i32 %99 to float
  %112 = fadd contract float %110, %111
  %113 = fptosi float %112 to i32
  %114 = or i32 %70, 3
  %115 = add nsw i32 %114, %30
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = mul nsw i32 %114, %5
  %120 = add nsw i32 %119, %23
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7, !amdgpu.noclobber !5
  %124 = fmul contract float %118, %123
  %125 = sitofp i32 %113 to float
  %126 = fadd contract float %124, %125
  %127 = fptosi float %126 to i32
  %128 = or i32 %70, 4
  %129 = add nsw i32 %128, %30
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = mul nsw i32 %128, %5
  %134 = add nsw i32 %133, %23
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = fmul contract float %132, %137
  %139 = sitofp i32 %127 to float
  %140 = fadd contract float %138, %139
  %141 = fptosi float %140 to i32
  %142 = or i32 %70, 5
  %143 = add nsw i32 %142, %30
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %0, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !5
  %147 = mul nsw i32 %142, %5
  %148 = add nsw i32 %147, %23
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !5
  %152 = fmul contract float %146, %151
  %153 = sitofp i32 %141 to float
  %154 = fadd contract float %152, %153
  %155 = fptosi float %154 to i32
  %156 = or i32 %70, 6
  %157 = add nsw i32 %156, %30
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %0, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7, !amdgpu.noclobber !5
  %161 = mul nsw i32 %156, %5
  %162 = add nsw i32 %161, %23
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %1, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7, !amdgpu.noclobber !5
  %166 = fmul contract float %160, %165
  %167 = sitofp i32 %155 to float
  %168 = fadd contract float %166, %167
  %169 = fptosi float %168 to i32
  %170 = or i32 %70, 7
  %171 = add nsw i32 %170, %30
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %0, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !7, !amdgpu.noclobber !5
  %175 = mul nsw i32 %170, %5
  %176 = add nsw i32 %175, %23
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %1, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !7, !amdgpu.noclobber !5
  %180 = fmul contract float %174, %179
  %181 = sitofp i32 %169 to float
  %182 = fadd contract float %180, %181
  %183 = fptosi float %182 to i32
  %184 = add nuw nsw i32 %70, 8
  %185 = add i32 %72, 8
  %186 = icmp eq i32 %185, %34
  br i1 %186, label %35, label %69, !llvm.loop !13

187:                                              ; preds = %63, %6
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
