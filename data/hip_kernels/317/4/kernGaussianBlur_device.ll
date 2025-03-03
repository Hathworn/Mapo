; ModuleID = '../data/hip_kernels/317/4/main.cu'
source_filename = "../data/hip_kernels/317/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16kernGaussianBluriiPhS_iPf(i32 %0, i32 %1, i8 addrspace(1)* nocapture writeonly %2, i8 addrspace(1)* nocapture readonly %3, i32 %4, float addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
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
  %24 = icmp slt i32 %15, %0
  %25 = icmp slt i32 %23, %1
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %201

27:                                               ; preds = %6
  %28 = icmp sgt i32 %4, 0
  br i1 %28, label %29, label %37

29:                                               ; preds = %27
  %30 = lshr i32 %4, 1
  %31 = sub i32 %15, %30
  %32 = sub i32 %23, %30
  %33 = and i32 %4, 1
  %34 = icmp eq i32 %4, 1
  %35 = and i32 %4, -2
  %36 = icmp eq i32 %33, 0
  br label %55

37:                                               ; preds = %107, %27
  %38 = phi float [ 0.000000e+00, %27 ], [ %108, %107 ]
  %39 = phi float [ 0.000000e+00, %27 ], [ %109, %107 ]
  %40 = phi float [ 0.000000e+00, %27 ], [ %110, %107 ]
  %41 = mul nsw i32 %23, %0
  %42 = add nsw i32 %41, %15
  %43 = mul nsw i32 %42, 3
  %44 = fptoui float %40 to i8
  %45 = sext i32 %43 to i64
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %45
  store i8 %44, i8 addrspace(1)* %46, align 1, !tbaa !7
  %47 = fptoui float %39 to i8
  %48 = add nsw i32 %43, 1
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %49
  store i8 %47, i8 addrspace(1)* %50, align 1, !tbaa !7
  %51 = fptoui float %38 to i8
  %52 = add nsw i32 %43, 2
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %53
  store i8 %51, i8 addrspace(1)* %54, align 1, !tbaa !7
  br label %201

55:                                               ; preds = %29, %107
  %56 = phi float [ 0.000000e+00, %29 ], [ %110, %107 ]
  %57 = phi float [ 0.000000e+00, %29 ], [ %109, %107 ]
  %58 = phi i32 [ 0, %29 ], [ %111, %107 ]
  %59 = phi float [ 0.000000e+00, %29 ], [ %108, %107 ]
  %60 = add i32 %31, %58
  %61 = icmp sgt i32 %60, -1
  %62 = icmp slt i32 %60, %0
  br i1 %34, label %63, label %113

63:                                               ; preds = %194, %55
  %64 = phi float [ undef, %55 ], [ %195, %194 ]
  %65 = phi float [ undef, %55 ], [ %196, %194 ]
  %66 = phi float [ undef, %55 ], [ %197, %194 ]
  %67 = phi float [ %56, %55 ], [ %197, %194 ]
  %68 = phi i32 [ 0, %55 ], [ %198, %194 ]
  %69 = phi float [ %57, %55 ], [ %196, %194 ]
  %70 = phi float [ %59, %55 ], [ %195, %194 ]
  br i1 %36, label %107, label %71

71:                                               ; preds = %63
  %72 = add i32 %32, %68
  %73 = icmp sgt i32 %72, -1
  %74 = select i1 %61, i1 %73, i1 false
  %75 = select i1 %74, i1 %62, i1 false
  %76 = icmp slt i32 %72, %1
  %77 = select i1 %75, i1 %76, i1 false
  br i1 %77, label %78, label %107

78:                                               ; preds = %71
  %79 = mul nsw i32 %72, %0
  %80 = add nsw i32 %79, %60
  %81 = mul nsw i32 %80, 3
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %82
  %84 = load i8, i8 addrspace(1)* %83, align 1, !tbaa !7, !amdgpu.noclobber !5
  %85 = uitofp i8 %84 to float
  %86 = mul nsw i32 %68, %4
  %87 = add nsw i32 %86, %58
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %5, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !10, !amdgpu.noclobber !5
  %91 = fmul contract float %90, %85
  %92 = fadd contract float %67, %91
  %93 = add nsw i32 %81, 1
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %94
  %96 = load i8, i8 addrspace(1)* %95, align 1, !tbaa !7, !amdgpu.noclobber !5
  %97 = uitofp i8 %96 to float
  %98 = fmul contract float %90, %97
  %99 = fadd contract float %69, %98
  %100 = add nsw i32 %81, 2
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %101
  %103 = load i8, i8 addrspace(1)* %102, align 1, !tbaa !7, !amdgpu.noclobber !5
  %104 = uitofp i8 %103 to float
  %105 = fmul contract float %90, %104
  %106 = fadd contract float %70, %105
  br label %107

107:                                              ; preds = %71, %78, %63
  %108 = phi float [ %64, %63 ], [ %106, %78 ], [ %70, %71 ]
  %109 = phi float [ %65, %63 ], [ %99, %78 ], [ %69, %71 ]
  %110 = phi float [ %66, %63 ], [ %92, %78 ], [ %67, %71 ]
  %111 = add nuw nsw i32 %58, 1
  %112 = icmp eq i32 %111, %4
  br i1 %112, label %37, label %55, !llvm.loop !12

113:                                              ; preds = %55, %194
  %114 = phi float [ %197, %194 ], [ %56, %55 ]
  %115 = phi i32 [ %198, %194 ], [ 0, %55 ]
  %116 = phi float [ %196, %194 ], [ %57, %55 ]
  %117 = phi float [ %195, %194 ], [ %59, %55 ]
  %118 = phi i32 [ %199, %194 ], [ 0, %55 ]
  %119 = add i32 %32, %115
  %120 = icmp sgt i32 %119, -1
  %121 = select i1 %61, i1 %120, i1 false
  %122 = select i1 %121, i1 %62, i1 false
  %123 = icmp slt i32 %119, %1
  %124 = select i1 %122, i1 %123, i1 false
  br i1 %124, label %125, label %154

125:                                              ; preds = %113
  %126 = mul nsw i32 %119, %0
  %127 = add nsw i32 %126, %60
  %128 = mul nsw i32 %127, 3
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %129
  %131 = load i8, i8 addrspace(1)* %130, align 1, !tbaa !7, !amdgpu.noclobber !5
  %132 = uitofp i8 %131 to float
  %133 = mul nsw i32 %115, %4
  %134 = add nsw i32 %133, %58
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %5, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !10, !amdgpu.noclobber !5
  %138 = fmul contract float %137, %132
  %139 = fadd contract float %114, %138
  %140 = add nsw i32 %128, 1
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %141
  %143 = load i8, i8 addrspace(1)* %142, align 1, !tbaa !7, !amdgpu.noclobber !5
  %144 = uitofp i8 %143 to float
  %145 = fmul contract float %137, %144
  %146 = fadd contract float %116, %145
  %147 = add nsw i32 %128, 2
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %148
  %150 = load i8, i8 addrspace(1)* %149, align 1, !tbaa !7, !amdgpu.noclobber !5
  %151 = uitofp i8 %150 to float
  %152 = fmul contract float %137, %151
  %153 = fadd contract float %117, %152
  br label %154

154:                                              ; preds = %125, %113
  %155 = phi float [ %153, %125 ], [ %117, %113 ]
  %156 = phi float [ %146, %125 ], [ %116, %113 ]
  %157 = phi float [ %139, %125 ], [ %114, %113 ]
  %158 = or i32 %115, 1
  %159 = add i32 %32, %158
  %160 = icmp sgt i32 %159, -1
  %161 = select i1 %61, i1 %160, i1 false
  %162 = select i1 %161, i1 %62, i1 false
  %163 = icmp slt i32 %159, %1
  %164 = select i1 %162, i1 %163, i1 false
  br i1 %164, label %165, label %194

165:                                              ; preds = %154
  %166 = mul nsw i32 %159, %0
  %167 = add nsw i32 %166, %60
  %168 = mul nsw i32 %167, 3
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %169
  %171 = load i8, i8 addrspace(1)* %170, align 1, !tbaa !7, !amdgpu.noclobber !5
  %172 = uitofp i8 %171 to float
  %173 = mul nsw i32 %158, %4
  %174 = add nsw i32 %173, %58
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %5, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !10, !amdgpu.noclobber !5
  %178 = fmul contract float %177, %172
  %179 = fadd contract float %157, %178
  %180 = add nsw i32 %168, 1
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %181
  %183 = load i8, i8 addrspace(1)* %182, align 1, !tbaa !7, !amdgpu.noclobber !5
  %184 = uitofp i8 %183 to float
  %185 = fmul contract float %177, %184
  %186 = fadd contract float %156, %185
  %187 = add nsw i32 %168, 2
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %188
  %190 = load i8, i8 addrspace(1)* %189, align 1, !tbaa !7, !amdgpu.noclobber !5
  %191 = uitofp i8 %190 to float
  %192 = fmul contract float %177, %191
  %193 = fadd contract float %155, %192
  br label %194

194:                                              ; preds = %165, %154
  %195 = phi float [ %193, %165 ], [ %155, %154 ]
  %196 = phi float [ %186, %165 ], [ %156, %154 ]
  %197 = phi float [ %179, %165 ], [ %157, %154 ]
  %198 = add nuw nsw i32 %115, 2
  %199 = add i32 %118, 2
  %200 = icmp eq i32 %199, %35
  br i1 %200, label %63, label %113, !llvm.loop !14

201:                                              ; preds = %6, %37
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
