; ModuleID = '../data/hip_kernels/890/28/main.cu'
source_filename = "../data/hip_kernels/890/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10pfbFilter4PfS_S_i(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %6, %16
  %18 = add i32 %17, %12
  %19 = shl nuw nsw i32 %10, 2
  %20 = mul i32 %19, %18
  %21 = add i32 %20, %11
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = zext i32 %11 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %2, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = fmul contract float %24, %27
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  store float %28, float addrspace(1)* %29, align 4, !tbaa !7
  %30 = add nsw i32 %21, %10
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %34 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %35 = fmul contract float %33, %34
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  store float %35, float addrspace(1)* %36, align 4, !tbaa !7
  %37 = shl nuw nsw i32 %10, 1
  %38 = add nsw i32 %21, %37
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %42 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %43 = fmul contract float %41, %42
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  store float %43, float addrspace(1)* %44, align 4, !tbaa !7
  %45 = mul nuw nsw i32 %10, 3
  %46 = add nsw i32 %21, %45
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %51 = fmul contract float %49, %50
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  store float %51, float addrspace(1)* %52, align 4, !tbaa !7
  %53 = icmp sgt i32 %3, 1
  br i1 %53, label %54, label %104

54:                                               ; preds = %4
  %55 = add i32 %3, -1
  %56 = and i32 %55, 1
  %57 = icmp eq i32 %3, 2
  br i1 %57, label %60, label %58

58:                                               ; preds = %54
  %59 = and i32 %55, -2
  br label %105

60:                                               ; preds = %105, %54
  %61 = phi float [ %35, %54 ], [ %185, %105 ]
  %62 = phi float [ %28, %54 ], [ %158, %105 ]
  %63 = phi i32 [ 1, %54 ], [ %159, %105 ]
  %64 = icmp eq i32 %56, 0
  br i1 %64, label %104, label %65

65:                                               ; preds = %60
  %66 = mul nuw nsw i32 %63, %10
  %67 = add nsw i32 %66, %21
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = add nuw i32 %66, %11
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = fmul contract float %70, %74
  %76 = fadd contract float %62, %75
  store float %76, float addrspace(1)* %29, align 4, !tbaa !7
  %77 = add nuw nsw i32 %63, 1
  %78 = mul nuw nsw i32 %77, %10
  %79 = add nsw i32 %78, %21
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %84 = fmul contract float %82, %83
  %85 = fadd contract float %61, %84
  store float %85, float addrspace(1)* %36, align 4, !tbaa !7
  %86 = add nuw nsw i32 %63, 2
  %87 = mul nuw nsw i32 %86, %10
  %88 = add nsw i32 %87, %21
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %93 = fmul contract float %91, %92
  %94 = fadd contract float %85, %93
  store float %94, float addrspace(1)* %36, align 4, !tbaa !7
  %95 = add nuw nsw i32 %63, 3
  %96 = mul nsw i32 %95, %10
  %97 = add nsw i32 %96, %21
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %102 = fmul contract float %100, %101
  %103 = fadd contract float %94, %102
  store float %103, float addrspace(1)* %36, align 4, !tbaa !7
  br label %104

104:                                              ; preds = %65, %60, %4
  ret void

105:                                              ; preds = %105, %58
  %106 = phi float [ %35, %58 ], [ %185, %105 ]
  %107 = phi float [ %28, %58 ], [ %158, %105 ]
  %108 = phi i32 [ 1, %58 ], [ %159, %105 ]
  %109 = phi i32 [ 0, %58 ], [ %186, %105 ]
  %110 = mul nuw nsw i32 %108, %10
  %111 = add nsw i32 %110, %21
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = add nuw i32 %110, %11
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %119 = fmul contract float %114, %118
  %120 = fadd contract float %107, %119
  store float %120, float addrspace(1)* %29, align 4, !tbaa !7
  %121 = add nuw nsw i32 %108, 1
  %122 = mul nuw nsw i32 %121, %10
  %123 = add nsw i32 %122, %21
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7
  %127 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %128 = fmul contract float %126, %127
  %129 = fadd contract float %106, %128
  store float %129, float addrspace(1)* %36, align 4, !tbaa !7
  %130 = add nuw nsw i32 %108, 2
  %131 = mul nuw nsw i32 %130, %10
  %132 = add nsw i32 %131, %21
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7
  %136 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %137 = fmul contract float %135, %136
  %138 = fadd contract float %129, %137
  store float %138, float addrspace(1)* %36, align 4, !tbaa !7
  %139 = add nuw nsw i32 %108, 3
  %140 = mul nsw i32 %139, %10
  %141 = add nsw i32 %140, %21
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %1, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7
  %145 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %146 = fmul contract float %144, %145
  %147 = fadd contract float %138, %146
  store float %147, float addrspace(1)* %36, align 4, !tbaa !7
  %148 = mul nuw nsw i32 %121, %10
  %149 = add nsw i32 %148, %21
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7
  %153 = add nuw i32 %148, %11
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %2, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %157 = fmul contract float %152, %156
  %158 = fadd contract float %120, %157
  store float %158, float addrspace(1)* %29, align 4, !tbaa !7
  %159 = add nuw nsw i32 %108, 2
  %160 = mul nuw nsw i32 %159, %10
  %161 = add nsw i32 %160, %21
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %1, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7
  %165 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %166 = fmul contract float %164, %165
  %167 = fadd contract float %147, %166
  store float %167, float addrspace(1)* %36, align 4, !tbaa !7
  %168 = add nuw nsw i32 %108, 3
  %169 = mul nuw nsw i32 %168, %10
  %170 = add nsw i32 %169, %21
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %1, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !7
  %174 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %175 = fmul contract float %173, %174
  %176 = fadd contract float %167, %175
  store float %176, float addrspace(1)* %36, align 4, !tbaa !7
  %177 = add nuw nsw i32 %108, 4
  %178 = mul nsw i32 %177, %10
  %179 = add nsw i32 %178, %21
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %1, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !7
  %183 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %184 = fmul contract float %182, %183
  %185 = fadd contract float %176, %184
  store float %185, float addrspace(1)* %36, align 4, !tbaa !7
  %186 = add i32 %109, 2
  %187 = icmp eq i32 %186, %59
  br i1 %187, label %60, label %105, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
