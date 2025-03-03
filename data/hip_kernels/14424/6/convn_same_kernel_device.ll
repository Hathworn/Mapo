; ModuleID = '../data/hip_kernels/14424/6/main.cu'
source_filename = "../data/hip_kernels/14424/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17convn_same_kernelPfS_S_iiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %16, %3
  %26 = icmp slt i32 %24, %4
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %179

28:                                               ; preds = %7
  %29 = sdiv i32 %6, 2
  %30 = sdiv i32 %5, 2
  %31 = icmp sgt i32 %6, 0
  br i1 %31, label %32, label %48

32:                                               ; preds = %28
  %33 = icmp sgt i32 %5, 0
  %34 = and i32 %5, 3
  %35 = icmp ult i32 %5, 4
  %36 = and i32 %5, -4
  %37 = icmp eq i32 %34, 0
  br label %38

38:                                               ; preds = %32, %85
  %39 = phi float [ 0.000000e+00, %32 ], [ %86, %85 ]
  %40 = phi i32 [ 0, %32 ], [ %87, %85 ]
  br i1 %33, label %41, label %85

41:                                               ; preds = %38
  %42 = sub nsw i32 %24, %40
  %43 = add nsw i32 %42, %29
  %44 = icmp slt i32 %43, 0
  %45 = icmp slt i32 %43, %4
  %46 = mul nsw i32 %40, %5
  %47 = mul nsw i32 %43, %3
  br i1 %35, label %54, label %89

48:                                               ; preds = %85, %28
  %49 = phi float [ 0.000000e+00, %28 ], [ %86, %85 ]
  %50 = mul nsw i32 %24, %3
  %51 = add nsw i32 %50, %16
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  store float %49, float addrspace(1)* %53, align 4, !tbaa !7
  br label %179

54:                                               ; preds = %174, %41
  %55 = phi float [ undef, %41 ], [ %175, %174 ]
  %56 = phi float [ %39, %41 ], [ %175, %174 ]
  %57 = phi i32 [ 0, %41 ], [ %176, %174 ]
  br i1 %37, label %85, label %58

58:                                               ; preds = %54, %80
  %59 = phi float [ %81, %80 ], [ %56, %54 ]
  %60 = phi i32 [ %82, %80 ], [ %57, %54 ]
  %61 = phi i32 [ %83, %80 ], [ 0, %54 ]
  %62 = sub nsw i32 %16, %60
  %63 = add nsw i32 %62, %30
  br i1 %44, label %80, label %64

64:                                               ; preds = %58
  %65 = icmp sgt i32 %63, -1
  %66 = select i1 %45, i1 %65, i1 false
  %67 = icmp slt i32 %63, %3
  %68 = select i1 %66, i1 %67, i1 false
  br i1 %68, label %69, label %80

69:                                               ; preds = %64
  %70 = add nsw i32 %60, %46
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = add nsw i32 %63, %47
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fmul contract float %73, %77
  %79 = fadd contract float %59, %78
  br label %80

80:                                               ; preds = %69, %64, %58
  %81 = phi float [ %79, %69 ], [ %59, %64 ], [ %59, %58 ]
  %82 = add nuw nsw i32 %60, 1
  %83 = add i32 %61, 1
  %84 = icmp eq i32 %83, %34
  br i1 %84, label %85, label %58, !llvm.loop !11

85:                                               ; preds = %54, %80, %38
  %86 = phi float [ %39, %38 ], [ %55, %54 ], [ %81, %80 ]
  %87 = add nuw nsw i32 %40, 1
  %88 = icmp eq i32 %87, %6
  br i1 %88, label %48, label %38, !llvm.loop !13

89:                                               ; preds = %41, %174
  %90 = phi float [ %175, %174 ], [ %39, %41 ]
  %91 = phi i32 [ %176, %174 ], [ 0, %41 ]
  %92 = phi i32 [ %177, %174 ], [ 0, %41 ]
  %93 = sub nsw i32 %16, %91
  %94 = add nsw i32 %93, %30
  br i1 %44, label %111, label %95

95:                                               ; preds = %89
  %96 = icmp sgt i32 %94, -1
  %97 = select i1 %45, i1 %96, i1 false
  %98 = icmp slt i32 %94, %3
  %99 = select i1 %97, i1 %98, i1 false
  br i1 %99, label %100, label %111

100:                                              ; preds = %95
  %101 = add nsw i32 %91, %46
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %2, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = add nsw i32 %94, %47
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = fmul contract float %104, %108
  %110 = fadd contract float %90, %109
  br label %111

111:                                              ; preds = %89, %95, %100
  %112 = phi float [ %110, %100 ], [ %90, %95 ], [ %90, %89 ]
  %113 = or i32 %91, 1
  %114 = sub nsw i32 %16, %113
  %115 = add nsw i32 %114, %30
  br i1 %44, label %132, label %116

116:                                              ; preds = %111
  %117 = icmp sgt i32 %115, -1
  %118 = select i1 %45, i1 %117, i1 false
  %119 = icmp slt i32 %115, %3
  %120 = select i1 %118, i1 %119, i1 false
  br i1 %120, label %121, label %132

121:                                              ; preds = %116
  %122 = add nsw i32 %113, %46
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = add nsw i32 %115, %47
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !5
  %130 = fmul contract float %125, %129
  %131 = fadd contract float %112, %130
  br label %132

132:                                              ; preds = %121, %116, %111
  %133 = phi float [ %131, %121 ], [ %112, %116 ], [ %112, %111 ]
  %134 = or i32 %91, 2
  %135 = sub nsw i32 %16, %134
  %136 = add nsw i32 %135, %30
  br i1 %44, label %153, label %137

137:                                              ; preds = %132
  %138 = icmp sgt i32 %136, -1
  %139 = select i1 %45, i1 %138, i1 false
  %140 = icmp slt i32 %136, %3
  %141 = select i1 %139, i1 %140, i1 false
  br i1 %141, label %142, label %153

142:                                              ; preds = %137
  %143 = add nsw i32 %134, %46
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %2, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !5
  %147 = add nsw i32 %136, %47
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7, !amdgpu.noclobber !5
  %151 = fmul contract float %146, %150
  %152 = fadd contract float %133, %151
  br label %153

153:                                              ; preds = %142, %137, %132
  %154 = phi float [ %152, %142 ], [ %133, %137 ], [ %133, %132 ]
  %155 = or i32 %91, 3
  %156 = sub nsw i32 %16, %155
  %157 = add nsw i32 %156, %30
  br i1 %44, label %174, label %158

158:                                              ; preds = %153
  %159 = icmp sgt i32 %157, -1
  %160 = select i1 %45, i1 %159, i1 false
  %161 = icmp slt i32 %157, %3
  %162 = select i1 %160, i1 %161, i1 false
  br i1 %162, label %163, label %174

163:                                              ; preds = %158
  %164 = add nsw i32 %155, %46
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %2, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7, !amdgpu.noclobber !5
  %168 = add nsw i32 %157, %47
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %1, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !7, !amdgpu.noclobber !5
  %172 = fmul contract float %167, %171
  %173 = fadd contract float %154, %172
  br label %174

174:                                              ; preds = %163, %158, %153
  %175 = phi float [ %173, %163 ], [ %154, %158 ], [ %154, %153 ]
  %176 = add nuw nsw i32 %91, 4
  %177 = add i32 %92, 4
  %178 = icmp eq i32 %177, %36
  br i1 %178, label %54, label %89, !llvm.loop !15

179:                                              ; preds = %7, %48
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
!15 = distinct !{!15, !14}
