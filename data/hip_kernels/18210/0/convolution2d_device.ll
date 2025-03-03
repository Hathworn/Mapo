; ModuleID = '../data/hip_kernels/18210/0/main.cu'
source_filename = "../data/hip_kernels/18210/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13convolution2dPfS_S_iiiiiib(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i1 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %11, %19
  %21 = add i32 %20, %13
  %22 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = mul i32 %12, %25
  %27 = add i32 %26, %14
  %28 = mul nsw i32 %27, %8
  %29 = add nsw i32 %28, %21
  %30 = mul nsw i32 %8, %7
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %184

32:                                               ; preds = %10
  %33 = icmp sgt i32 %5, 0
  br i1 %33, label %34, label %55

34:                                               ; preds = %32
  %35 = icmp sgt i32 %6, 0
  %36 = lshr i32 %5, 1
  %37 = sub nsw i32 0, %36
  %38 = sdiv i32 %6, -2
  %39 = select i1 %9, i32 %37, i32 0
  %40 = add i32 %21, %39
  %41 = select i1 %9, i32 %38, i32 0
  %42 = add i32 %27, %41
  %43 = and i32 %6, 3
  %44 = icmp ult i32 %6, 4
  %45 = and i32 %6, -4
  %46 = icmp eq i32 %43, 0
  br label %47

47:                                               ; preds = %34, %90
  %48 = phi i32 [ 0, %34 ], [ %92, %90 ]
  %49 = phi float [ 0.000000e+00, %34 ], [ %91, %90 ]
  br i1 %35, label %50, label %90

50:                                               ; preds = %47
  %51 = mul nsw i32 %48, %6
  %52 = add nsw i32 %40, %48
  %53 = icmp sgt i32 %52, -1
  %54 = icmp slt i32 %52, %3
  br i1 %44, label %59, label %94

55:                                               ; preds = %90, %32
  %56 = phi float [ 0.000000e+00, %32 ], [ %91, %90 ]
  %57 = sext i32 %29 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  store float %56, float addrspace(1)* %58, align 4, !tbaa !7
  br label %184

59:                                               ; preds = %179, %50
  %60 = phi float [ undef, %50 ], [ %180, %179 ]
  %61 = phi i32 [ 0, %50 ], [ %181, %179 ]
  %62 = phi float [ %49, %50 ], [ %180, %179 ]
  br i1 %46, label %90, label %63

63:                                               ; preds = %59, %85
  %64 = phi i32 [ %87, %85 ], [ %61, %59 ]
  %65 = phi float [ %86, %85 ], [ %62, %59 ]
  %66 = phi i32 [ %88, %85 ], [ 0, %59 ]
  %67 = add nsw i32 %42, %64
  br i1 %53, label %68, label %85

68:                                               ; preds = %63
  %69 = icmp sgt i32 %67, -1
  %70 = select i1 %54, i1 %69, i1 false
  %71 = icmp slt i32 %67, %4
  %72 = select i1 %70, i1 %71, i1 false
  br i1 %72, label %73, label %85

73:                                               ; preds = %68
  %74 = mul nsw i32 %67, %4
  %75 = add nsw i32 %74, %52
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !6
  %79 = add nsw i32 %64, %51
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !6
  %83 = fmul contract float %78, %82
  %84 = fadd contract float %65, %83
  br label %85

85:                                               ; preds = %73, %68, %63
  %86 = phi float [ %84, %73 ], [ %65, %68 ], [ %65, %63 ]
  %87 = add nuw nsw i32 %64, 1
  %88 = add i32 %66, 1
  %89 = icmp eq i32 %88, %43
  br i1 %89, label %90, label %63, !llvm.loop !11

90:                                               ; preds = %59, %85, %47
  %91 = phi float [ %49, %47 ], [ %60, %59 ], [ %86, %85 ]
  %92 = add nuw nsw i32 %48, 1
  %93 = icmp eq i32 %92, %5
  br i1 %93, label %55, label %47, !llvm.loop !13

94:                                               ; preds = %50, %179
  %95 = phi i32 [ %181, %179 ], [ 0, %50 ]
  %96 = phi float [ %180, %179 ], [ %49, %50 ]
  %97 = phi i32 [ %182, %179 ], [ 0, %50 ]
  %98 = add nsw i32 %42, %95
  br i1 %53, label %99, label %116

99:                                               ; preds = %94
  %100 = icmp sgt i32 %98, -1
  %101 = select i1 %54, i1 %100, i1 false
  %102 = icmp slt i32 %98, %4
  %103 = select i1 %101, i1 %102, i1 false
  br i1 %103, label %104, label %116

104:                                              ; preds = %99
  %105 = mul nsw i32 %98, %4
  %106 = add nsw i32 %105, %52
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !6
  %110 = add nsw i32 %95, %51
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !6
  %114 = fmul contract float %109, %113
  %115 = fadd contract float %96, %114
  br label %116

116:                                              ; preds = %104, %99, %94
  %117 = phi float [ %115, %104 ], [ %96, %99 ], [ %96, %94 ]
  %118 = or i32 %95, 1
  %119 = add nsw i32 %42, %118
  br i1 %53, label %120, label %137

120:                                              ; preds = %116
  %121 = icmp sgt i32 %119, -1
  %122 = select i1 %54, i1 %121, i1 false
  %123 = icmp slt i32 %119, %4
  %124 = select i1 %122, i1 %123, i1 false
  br i1 %124, label %125, label %137

125:                                              ; preds = %120
  %126 = mul nsw i32 %119, %4
  %127 = add nsw i32 %126, %52
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !6
  %131 = add nsw i32 %118, %51
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !6
  %135 = fmul contract float %130, %134
  %136 = fadd contract float %117, %135
  br label %137

137:                                              ; preds = %125, %120, %116
  %138 = phi float [ %136, %125 ], [ %117, %120 ], [ %117, %116 ]
  %139 = or i32 %95, 2
  %140 = add nsw i32 %42, %139
  br i1 %53, label %141, label %158

141:                                              ; preds = %137
  %142 = icmp sgt i32 %140, -1
  %143 = select i1 %54, i1 %142, i1 false
  %144 = icmp slt i32 %140, %4
  %145 = select i1 %143, i1 %144, i1 false
  br i1 %145, label %146, label %158

146:                                              ; preds = %141
  %147 = mul nsw i32 %140, %4
  %148 = add nsw i32 %147, %52
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !6
  %152 = add nsw i32 %139, %51
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !6
  %156 = fmul contract float %151, %155
  %157 = fadd contract float %138, %156
  br label %158

158:                                              ; preds = %146, %141, %137
  %159 = phi float [ %157, %146 ], [ %138, %141 ], [ %138, %137 ]
  %160 = or i32 %95, 3
  %161 = add nsw i32 %42, %160
  br i1 %53, label %162, label %179

162:                                              ; preds = %158
  %163 = icmp sgt i32 %161, -1
  %164 = select i1 %54, i1 %163, i1 false
  %165 = icmp slt i32 %161, %4
  %166 = select i1 %164, i1 %165, i1 false
  br i1 %166, label %167, label %179

167:                                              ; preds = %162
  %168 = mul nsw i32 %161, %4
  %169 = add nsw i32 %168, %52
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %0, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7, !amdgpu.noclobber !6
  %173 = add nsw i32 %160, %51
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %1, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !7, !amdgpu.noclobber !6
  %177 = fmul contract float %172, %176
  %178 = fadd contract float %159, %177
  br label %179

179:                                              ; preds = %167, %162, %158
  %180 = phi float [ %178, %167 ], [ %159, %162 ], [ %159, %158 ]
  %181 = add nuw nsw i32 %95, 4
  %182 = add i32 %97, 4
  %183 = icmp eq i32 %182, %45
  br i1 %183, label %59, label %94, !llvm.loop !15

184:                                              ; preds = %55, %10
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
