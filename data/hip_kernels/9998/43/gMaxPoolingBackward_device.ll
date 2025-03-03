; ModuleID = '../data/hip_kernels/9998/43/main.cu'
source_filename = "../data/hip_kernels/9998/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19gMaxPoolingBackwardPfiiS_S_iiS_iiii(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4, i32 %5, i32 %6, float addrspace(1)* nocapture readonly %7, i32 %8, i32 %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = add i32 %20, %13
  %22 = mul nsw i32 %2, %1
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %210

24:                                               ; preds = %12
  %25 = freeze i32 %21
  %26 = freeze i32 %1
  %27 = sdiv i32 %25, %26
  %28 = mul i32 %27, %26
  %29 = sub i32 %25, %28
  %30 = mul nsw i32 %27, %6
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %3, i64 %31
  %33 = mul nsw i32 %29, %10
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %32, i64 %34
  %36 = add nsw i32 %1, -1
  %37 = icmp eq i32 %29, %36
  %38 = select i1 %37, i32 %11, i32 %10
  %39 = sdiv i32 %27, %8
  %40 = mul nsw i32 %39, %9
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %7, i64 %41
  %43 = mul nsw i32 %38, %29
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %42, i64 %44
  %46 = icmp sgt i32 %38, 1
  br i1 %46, label %47, label %79

47:                                               ; preds = %24
  %48 = add i32 %38, -1
  %49 = add i32 %38, -2
  %50 = and i32 %48, 7
  %51 = icmp ult i32 %49, 7
  br i1 %51, label %54, label %52

52:                                               ; preds = %47
  %53 = and i32 %48, -8
  br label %92

54:                                               ; preds = %92, %47
  %55 = phi i64 [ undef, %47 ], [ %206, %92 ]
  %56 = phi i32 [ 1, %47 ], [ %207, %92 ]
  %57 = phi i64 [ 0, %47 ], [ %206, %92 ]
  %58 = icmp eq i32 %50, 0
  br i1 %58, label %79, label %59

59:                                               ; preds = %54, %59
  %60 = phi i32 [ %76, %59 ], [ %56, %54 ]
  %61 = phi i64 [ %75, %59 ], [ %57, %54 ]
  %62 = phi i32 [ %77, %59 ], [ 0, %54 ]
  %63 = zext i32 %60 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %35, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = getelementptr inbounds float, float addrspace(1)* %45, i64 %63
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  %68 = fmul contract float %65, %67
  %69 = getelementptr inbounds float, float addrspace(1)* %35, i64 %61
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = getelementptr inbounds float, float addrspace(1)* %45, i64 %61
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !6
  %73 = fmul contract float %70, %72
  %74 = fcmp contract ogt float %68, %73
  %75 = select i1 %74, i64 %63, i64 %61
  %76 = add nuw nsw i32 %60, 1
  %77 = add i32 %62, 1
  %78 = icmp eq i32 %77, %50
  br i1 %78, label %79, label %59, !llvm.loop !11

79:                                               ; preds = %54, %59, %24
  %80 = phi i64 [ 0, %24 ], [ %55, %54 ], [ %75, %59 ]
  %81 = mul nsw i32 %29, %2
  %82 = add nsw i32 %81, %27
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !6
  %86 = add nsw i32 %43, %30
  %87 = sext i32 %86 to i64
  %88 = add i64 %80, %87
  %89 = getelementptr inbounds float, float addrspace(1)* %4, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !6
  %91 = fadd contract float %85, %90
  store float %91, float addrspace(1)* %89, align 4, !tbaa !7
  br label %210

92:                                               ; preds = %92, %52
  %93 = phi i32 [ 1, %52 ], [ %207, %92 ]
  %94 = phi i64 [ 0, %52 ], [ %206, %92 ]
  %95 = phi i32 [ 0, %52 ], [ %208, %92 ]
  %96 = zext i32 %93 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %35, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !6
  %99 = getelementptr inbounds float, float addrspace(1)* %45, i64 %96
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !6
  %101 = fmul contract float %98, %100
  %102 = getelementptr inbounds float, float addrspace(1)* %35, i64 %94
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !6
  %104 = getelementptr inbounds float, float addrspace(1)* %45, i64 %94
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !6
  %106 = fmul contract float %103, %105
  %107 = fcmp contract ogt float %101, %106
  %108 = select i1 %107, i64 %96, i64 %94
  %109 = add nuw nsw i32 %93, 1
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %35, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !6
  %113 = getelementptr inbounds float, float addrspace(1)* %45, i64 %110
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !6
  %115 = fmul contract float %112, %114
  %116 = getelementptr inbounds float, float addrspace(1)* %35, i64 %108
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !6
  %118 = getelementptr inbounds float, float addrspace(1)* %45, i64 %108
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !6
  %120 = fmul contract float %117, %119
  %121 = fcmp contract ogt float %115, %120
  %122 = select i1 %121, i64 %110, i64 %108
  %123 = add nuw nsw i32 %93, 2
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %35, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !6
  %127 = getelementptr inbounds float, float addrspace(1)* %45, i64 %124
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7, !amdgpu.noclobber !6
  %129 = fmul contract float %126, %128
  %130 = getelementptr inbounds float, float addrspace(1)* %35, i64 %122
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !6
  %132 = getelementptr inbounds float, float addrspace(1)* %45, i64 %122
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !6
  %134 = fmul contract float %131, %133
  %135 = fcmp contract ogt float %129, %134
  %136 = select i1 %135, i64 %124, i64 %122
  %137 = add nuw nsw i32 %93, 3
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %35, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !6
  %141 = getelementptr inbounds float, float addrspace(1)* %45, i64 %138
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !6
  %143 = fmul contract float %140, %142
  %144 = getelementptr inbounds float, float addrspace(1)* %35, i64 %136
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !6
  %146 = getelementptr inbounds float, float addrspace(1)* %45, i64 %136
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !6
  %148 = fmul contract float %145, %147
  %149 = fcmp contract ogt float %143, %148
  %150 = select i1 %149, i64 %138, i64 %136
  %151 = add nuw nsw i32 %93, 4
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %35, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !7, !amdgpu.noclobber !6
  %155 = getelementptr inbounds float, float addrspace(1)* %45, i64 %152
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7, !amdgpu.noclobber !6
  %157 = fmul contract float %154, %156
  %158 = getelementptr inbounds float, float addrspace(1)* %35, i64 %150
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7, !amdgpu.noclobber !6
  %160 = getelementptr inbounds float, float addrspace(1)* %45, i64 %150
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7, !amdgpu.noclobber !6
  %162 = fmul contract float %159, %161
  %163 = fcmp contract ogt float %157, %162
  %164 = select i1 %163, i64 %152, i64 %150
  %165 = add nuw nsw i32 %93, 5
  %166 = zext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %35, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7, !amdgpu.noclobber !6
  %169 = getelementptr inbounds float, float addrspace(1)* %45, i64 %166
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7, !amdgpu.noclobber !6
  %171 = fmul contract float %168, %170
  %172 = getelementptr inbounds float, float addrspace(1)* %35, i64 %164
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !7, !amdgpu.noclobber !6
  %174 = getelementptr inbounds float, float addrspace(1)* %45, i64 %164
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !7, !amdgpu.noclobber !6
  %176 = fmul contract float %173, %175
  %177 = fcmp contract ogt float %171, %176
  %178 = select i1 %177, i64 %166, i64 %164
  %179 = add nuw nsw i32 %93, 6
  %180 = zext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %35, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !7, !amdgpu.noclobber !6
  %183 = getelementptr inbounds float, float addrspace(1)* %45, i64 %180
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !7, !amdgpu.noclobber !6
  %185 = fmul contract float %182, %184
  %186 = getelementptr inbounds float, float addrspace(1)* %35, i64 %178
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !7, !amdgpu.noclobber !6
  %188 = getelementptr inbounds float, float addrspace(1)* %45, i64 %178
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !7, !amdgpu.noclobber !6
  %190 = fmul contract float %187, %189
  %191 = fcmp contract ogt float %185, %190
  %192 = select i1 %191, i64 %180, i64 %178
  %193 = add nuw nsw i32 %93, 7
  %194 = zext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %35, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !7, !amdgpu.noclobber !6
  %197 = getelementptr inbounds float, float addrspace(1)* %45, i64 %194
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !7, !amdgpu.noclobber !6
  %199 = fmul contract float %196, %198
  %200 = getelementptr inbounds float, float addrspace(1)* %35, i64 %192
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !7, !amdgpu.noclobber !6
  %202 = getelementptr inbounds float, float addrspace(1)* %45, i64 %192
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !7, !amdgpu.noclobber !6
  %204 = fmul contract float %201, %203
  %205 = fcmp contract ogt float %199, %204
  %206 = select i1 %205, i64 %194, i64 %192
  %207 = add nuw nsw i32 %93, 8
  %208 = add i32 %95, 8
  %209 = icmp eq i32 %208, %53
  br i1 %209, label %54, label %92, !llvm.loop !13

210:                                              ; preds = %12, %79
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
