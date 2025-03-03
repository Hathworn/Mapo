; ModuleID = '../data/hip_kernels/15618/0/main.cu'
source_filename = "../data/hip_kernels/15618/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@desiredPosition = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14computeHeatmapPfS_iPimS0_m(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 addrspace(1)* nocapture %3, i64 %4, i32 addrspace(1)* nocapture readnone %5, i64 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %9, %16
  %18 = add i32 %17, %11
  %19 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %8, %22
  %24 = add i32 %23, %10
  %25 = bitcast i32 addrspace(1)* %3 to i8 addrspace(1)*
  %26 = sext i32 %24 to i64
  %27 = mul i64 %26, %4
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %25, i64 %27
  %29 = bitcast i8 addrspace(1)* %28 to i32 addrspace(1)*
  %30 = sext i32 %18 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %29, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = sitofp i32 %32 to double
  %34 = fmul contract double %33, 8.000000e-01
  %35 = tail call double @llvm.round.f64(double %34)
  %36 = fptosi double %35 to i32
  store i32 %36, i32 addrspace(1)* %31, align 4, !tbaa !7
  %37 = icmp eq i32 %10, 0
  %38 = icmp eq i32 %11, 0
  %39 = select i1 %37, i1 %38, i1 false
  %40 = icmp sgt i32 %2, 0
  %41 = select i1 %39, i1 %40, i1 false
  br i1 %41, label %42, label %141

42:                                               ; preds = %7
  %43 = and i32 %2, 7
  %44 = icmp ult i32 %2, 8
  br i1 %44, label %124, label %45

45:                                               ; preds = %42
  %46 = and i32 %2, -8
  br label %47

47:                                               ; preds = %47, %45
  %48 = phi i32 [ 0, %45 ], [ %121, %47 ]
  %49 = phi i32 [ 0, %45 ], [ %122, %47 ]
  %50 = zext i32 %48 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !11, !amdgpu.noclobber !6
  %53 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %48
  store float %52, float addrspace(3)* %53, align 4, !tbaa !11
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !11, !amdgpu.noclobber !6
  %56 = add nsw i32 %48, %2
  %57 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %56
  store float %55, float addrspace(3)* %57, align 4, !tbaa !11
  %58 = or i32 %48, 1
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !11, !amdgpu.noclobber !6
  %62 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %58
  store float %61, float addrspace(3)* %62, align 4, !tbaa !11
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !11, !amdgpu.noclobber !6
  %65 = add nsw i32 %58, %2
  %66 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %65
  store float %64, float addrspace(3)* %66, align 4, !tbaa !11
  %67 = or i32 %48, 2
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !11, !amdgpu.noclobber !6
  %71 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %67
  store float %70, float addrspace(3)* %71, align 4, !tbaa !11
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !11, !amdgpu.noclobber !6
  %74 = add nsw i32 %67, %2
  %75 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %74
  store float %73, float addrspace(3)* %75, align 4, !tbaa !11
  %76 = or i32 %48, 3
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !11, !amdgpu.noclobber !6
  %80 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %76
  store float %79, float addrspace(3)* %80, align 4, !tbaa !11
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !11, !amdgpu.noclobber !6
  %83 = add nsw i32 %76, %2
  %84 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %83
  store float %82, float addrspace(3)* %84, align 4, !tbaa !11
  %85 = or i32 %48, 4
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !11, !amdgpu.noclobber !6
  %89 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %85
  store float %88, float addrspace(3)* %89, align 4, !tbaa !11
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !11, !amdgpu.noclobber !6
  %92 = add nsw i32 %85, %2
  %93 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %92
  store float %91, float addrspace(3)* %93, align 4, !tbaa !11
  %94 = or i32 %48, 5
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !11, !amdgpu.noclobber !6
  %98 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %94
  store float %97, float addrspace(3)* %98, align 4, !tbaa !11
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !11, !amdgpu.noclobber !6
  %101 = add nsw i32 %94, %2
  %102 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %101
  store float %100, float addrspace(3)* %102, align 4, !tbaa !11
  %103 = or i32 %48, 6
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !11, !amdgpu.noclobber !6
  %107 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %103
  store float %106, float addrspace(3)* %107, align 4, !tbaa !11
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !11, !amdgpu.noclobber !6
  %110 = add nsw i32 %103, %2
  %111 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %110
  store float %109, float addrspace(3)* %111, align 4, !tbaa !11
  %112 = or i32 %48, 7
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !11, !amdgpu.noclobber !6
  %116 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %112
  store float %115, float addrspace(3)* %116, align 4, !tbaa !11
  %117 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !11, !amdgpu.noclobber !6
  %119 = add nsw i32 %112, %2
  %120 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %119
  store float %118, float addrspace(3)* %120, align 4, !tbaa !11
  %121 = add nuw nsw i32 %48, 8
  %122 = add i32 %49, 8
  %123 = icmp eq i32 %122, %46
  br i1 %123, label %124, label %47, !llvm.loop !13

124:                                              ; preds = %47, %42
  %125 = phi i32 [ 0, %42 ], [ %121, %47 ]
  %126 = icmp eq i32 %43, 0
  br i1 %126, label %141, label %127

127:                                              ; preds = %124, %127
  %128 = phi i32 [ %138, %127 ], [ %125, %124 ]
  %129 = phi i32 [ %139, %127 ], [ 0, %124 ]
  %130 = zext i32 %128 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !11, !amdgpu.noclobber !6
  %133 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %128
  store float %132, float addrspace(3)* %133, align 4, !tbaa !11
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !11, !amdgpu.noclobber !6
  %136 = add nsw i32 %128, %2
  %137 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %136
  store float %135, float addrspace(3)* %137, align 4, !tbaa !11
  %138 = add nuw nsw i32 %128, 1
  %139 = add i32 %129, 1
  %140 = icmp eq i32 %139, %43
  br i1 %140, label %141, label %127, !llvm.loop !15

141:                                              ; preds = %124, %127, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %40, label %142, label %166

142:                                              ; preds = %141
  %143 = and i32 %2, 1
  %144 = icmp eq i32 %2, 1
  br i1 %144, label %147, label %145

145:                                              ; preds = %142
  %146 = and i32 %2, -2
  br label %167

147:                                              ; preds = %202, %142
  %148 = phi i32 [ 0, %142 ], [ %203, %202 ]
  %149 = icmp eq i32 %143, 0
  br i1 %149, label %166, label %150

150:                                              ; preds = %147
  %151 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %148
  %152 = load float, float addrspace(3)* %151, align 4, !tbaa !11
  %153 = fptosi float %152 to i32
  %154 = icmp eq i32 %18, %153
  br i1 %154, label %155, label %166

155:                                              ; preds = %150
  %156 = add nsw i32 %148, %2
  %157 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %156
  %158 = load float, float addrspace(3)* %157, align 4, !tbaa !11
  %159 = fptosi float %158 to i32
  %160 = icmp eq i32 %24, %159
  br i1 %160, label %161, label %166

161:                                              ; preds = %155
  %162 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %163 = icmp slt i32 %162, 216
  br i1 %163, label %164, label %166

164:                                              ; preds = %161
  %165 = add nsw i32 %162, 40
  store i32 %165, i32 addrspace(1)* %31, align 4, !tbaa !7
  br label %166

166:                                              ; preds = %147, %164, %161, %155, %150, %141
  ret void

167:                                              ; preds = %202, %145
  %168 = phi i32 [ 0, %145 ], [ %203, %202 ]
  %169 = phi i32 [ 0, %145 ], [ %204, %202 ]
  %170 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %168
  %171 = load float, float addrspace(3)* %170, align 4, !tbaa !11
  %172 = fptosi float %171 to i32
  %173 = icmp eq i32 %18, %172
  br i1 %173, label %174, label %185

174:                                              ; preds = %167
  %175 = add nsw i32 %168, %2
  %176 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %175
  %177 = load float, float addrspace(3)* %176, align 4, !tbaa !11
  %178 = fptosi float %177 to i32
  %179 = icmp eq i32 %24, %178
  br i1 %179, label %180, label %185

180:                                              ; preds = %174
  %181 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %182 = icmp slt i32 %181, 216
  br i1 %182, label %183, label %185

183:                                              ; preds = %180
  %184 = add nsw i32 %181, 40
  store i32 %184, i32 addrspace(1)* %31, align 4, !tbaa !7
  br label %185

185:                                              ; preds = %180, %183, %174, %167
  %186 = or i32 %168, 1
  %187 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %186
  %188 = load float, float addrspace(3)* %187, align 4, !tbaa !11
  %189 = fptosi float %188 to i32
  %190 = icmp eq i32 %18, %189
  br i1 %190, label %191, label %202

191:                                              ; preds = %185
  %192 = add nsw i32 %186, %2
  %193 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @desiredPosition, i32 0, i32 %192
  %194 = load float, float addrspace(3)* %193, align 4, !tbaa !11
  %195 = fptosi float %194 to i32
  %196 = icmp eq i32 %24, %195
  br i1 %196, label %197, label %202

197:                                              ; preds = %191
  %198 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %199 = icmp slt i32 %198, 216
  br i1 %199, label %200, label %202

200:                                              ; preds = %197
  %201 = add nsw i32 %198, 40
  store i32 %201, i32 addrspace(1)* %31, align 4, !tbaa !7
  br label %202

202:                                              ; preds = %200, %197, %191, %185
  %203 = add nuw nsw i32 %168, 2
  %204 = add i32 %169, 2
  %205 = icmp eq i32 %204, %146
  br i1 %205, label %147, label %167, !llvm.loop !17
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.round.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
