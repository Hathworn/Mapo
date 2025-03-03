; ModuleID = '../data/hip_kernels/18086/0/main.cu'
source_filename = "../data/hip_kernels/18086/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13cuda_filter2DPfS_S_iiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %17
  %25 = icmp slt i32 %16, %4
  %26 = icmp slt i32 %24, %3
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %190

28:                                               ; preds = %7
  %29 = icmp sgt i32 %5, 0
  br i1 %29, label %30, label %50

30:                                               ; preds = %28
  %31 = icmp sgt i32 %6, 0
  %32 = add nsw i32 %5, -1
  %33 = lshr i32 %32, 1
  %34 = sub i32 %16, %33
  %35 = add i32 %6, -1
  %36 = sdiv i32 %35, -2
  %37 = and i32 %6, 3
  %38 = icmp ult i32 %6, 4
  %39 = and i32 %6, -4
  %40 = icmp eq i32 %37, 0
  br label %41

41:                                               ; preds = %30, %92
  %42 = phi i32 [ 0, %30 ], [ %94, %92 ]
  %43 = phi float [ 0.000000e+00, %30 ], [ %93, %92 ]
  br i1 %31, label %44, label %92

44:                                               ; preds = %41
  %45 = add i32 %34, %42
  %46 = icmp sgt i32 %45, -1
  %47 = icmp slt i32 %45, %4
  %48 = mul nsw i32 %42, %6
  %49 = mul nsw i32 %45, %3
  br i1 %38, label %60, label %96

50:                                               ; preds = %92, %28
  %51 = phi float [ 0.000000e+00, %28 ], [ %93, %92 ]
  %52 = fcmp contract olt float %51, 0.000000e+00
  %53 = fcmp contract ogt float %51, 2.550000e+02
  %54 = select contract i1 %53, float 2.550000e+02, float %51
  %55 = select contract i1 %52, float 0.000000e+00, float %54
  %56 = mul nsw i32 %16, %3
  %57 = add nsw i32 %56, %24
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  store float %55, float addrspace(1)* %59, align 4, !tbaa !7
  br label %190

60:                                               ; preds = %185, %44
  %61 = phi float [ undef, %44 ], [ %186, %185 ]
  %62 = phi i32 [ 0, %44 ], [ %187, %185 ]
  %63 = phi float [ %43, %44 ], [ %186, %185 ]
  br i1 %40, label %92, label %64

64:                                               ; preds = %60, %87
  %65 = phi i32 [ %89, %87 ], [ %62, %60 ]
  %66 = phi float [ %88, %87 ], [ %63, %60 ]
  %67 = phi i32 [ %90, %87 ], [ 0, %60 ]
  br i1 %46, label %68, label %87

68:                                               ; preds = %64
  %69 = add i32 %65, %24
  %70 = add i32 %69, %36
  %71 = icmp sgt i32 %70, -1
  %72 = icmp slt i32 %70, %3
  %73 = select i1 %71, i1 %72, i1 false
  %74 = select i1 %73, i1 %47, i1 false
  br i1 %74, label %75, label %87

75:                                               ; preds = %68
  %76 = add nsw i32 %65, %48
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !6
  %80 = sub i32 %69, %33
  %81 = add i32 %80, %49
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !6
  %85 = fmul contract float %79, %84
  %86 = fadd contract float %66, %85
  br label %87

87:                                               ; preds = %75, %68, %64
  %88 = phi float [ %86, %75 ], [ %66, %68 ], [ %66, %64 ]
  %89 = add nuw nsw i32 %65, 1
  %90 = add i32 %67, 1
  %91 = icmp eq i32 %90, %37
  br i1 %91, label %92, label %64, !llvm.loop !11

92:                                               ; preds = %60, %87, %41
  %93 = phi float [ %43, %41 ], [ %61, %60 ], [ %88, %87 ]
  %94 = add nuw nsw i32 %42, 1
  %95 = icmp eq i32 %94, %5
  br i1 %95, label %50, label %41, !llvm.loop !13

96:                                               ; preds = %44, %185
  %97 = phi i32 [ %187, %185 ], [ 0, %44 ]
  %98 = phi float [ %186, %185 ], [ %43, %44 ]
  %99 = phi i32 [ %188, %185 ], [ 0, %44 ]
  br i1 %46, label %100, label %119

100:                                              ; preds = %96
  %101 = add i32 %97, %24
  %102 = add i32 %101, %36
  %103 = icmp sgt i32 %102, -1
  %104 = icmp slt i32 %102, %3
  %105 = select i1 %103, i1 %104, i1 false
  %106 = select i1 %105, i1 %47, i1 false
  br i1 %106, label %107, label %119

107:                                              ; preds = %100
  %108 = add nsw i32 %97, %48
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %2, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !6
  %112 = sub i32 %101, %33
  %113 = add i32 %112, %49
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !6
  %117 = fmul contract float %111, %116
  %118 = fadd contract float %98, %117
  br label %119

119:                                              ; preds = %96, %100, %107
  %120 = phi float [ %118, %107 ], [ %98, %100 ], [ %98, %96 ]
  %121 = or i32 %97, 1
  br i1 %46, label %122, label %141

122:                                              ; preds = %119
  %123 = add i32 %121, %24
  %124 = add i32 %123, %36
  %125 = icmp sgt i32 %124, -1
  %126 = icmp slt i32 %124, %3
  %127 = select i1 %125, i1 %126, i1 false
  %128 = select i1 %127, i1 %47, i1 false
  br i1 %128, label %129, label %141

129:                                              ; preds = %122
  %130 = add nsw i32 %121, %48
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %2, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !6
  %134 = sub i32 %123, %33
  %135 = add i32 %134, %49
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !6
  %139 = fmul contract float %133, %138
  %140 = fadd contract float %120, %139
  br label %141

141:                                              ; preds = %129, %122, %119
  %142 = phi float [ %140, %129 ], [ %120, %122 ], [ %120, %119 ]
  %143 = or i32 %97, 2
  br i1 %46, label %144, label %163

144:                                              ; preds = %141
  %145 = add i32 %143, %24
  %146 = add i32 %145, %36
  %147 = icmp sgt i32 %146, -1
  %148 = icmp slt i32 %146, %3
  %149 = select i1 %147, i1 %148, i1 false
  %150 = select i1 %149, i1 %47, i1 false
  br i1 %150, label %151, label %163

151:                                              ; preds = %144
  %152 = add nsw i32 %143, %48
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %2, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !6
  %156 = sub i32 %145, %33
  %157 = add i32 %156, %49
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7, !amdgpu.noclobber !6
  %161 = fmul contract float %155, %160
  %162 = fadd contract float %142, %161
  br label %163

163:                                              ; preds = %151, %144, %141
  %164 = phi float [ %162, %151 ], [ %142, %144 ], [ %142, %141 ]
  %165 = or i32 %97, 3
  br i1 %46, label %166, label %185

166:                                              ; preds = %163
  %167 = add i32 %165, %24
  %168 = add i32 %167, %36
  %169 = icmp sgt i32 %168, -1
  %170 = icmp slt i32 %168, %3
  %171 = select i1 %169, i1 %170, i1 false
  %172 = select i1 %171, i1 %47, i1 false
  br i1 %172, label %173, label %185

173:                                              ; preds = %166
  %174 = add nsw i32 %165, %48
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %2, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !7, !amdgpu.noclobber !6
  %178 = sub i32 %167, %33
  %179 = add i32 %178, %49
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %1, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !7, !amdgpu.noclobber !6
  %183 = fmul contract float %177, %182
  %184 = fadd contract float %164, %183
  br label %185

185:                                              ; preds = %173, %166, %163
  %186 = phi float [ %184, %173 ], [ %164, %166 ], [ %164, %163 ]
  %187 = add nuw nsw i32 %97, 4
  %188 = add i32 %99, 4
  %189 = icmp eq i32 %188, %39
  br i1 %189, label %60, label %96, !llvm.loop !15

190:                                              ; preds = %50, %7
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
!15 = distinct !{!15, !14}
