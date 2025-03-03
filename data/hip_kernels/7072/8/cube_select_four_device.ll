; ModuleID = '../data/hip_kernels/7072/8/main.cu'
source_filename = "../data/hip_kernels/7072/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16cube_select_fouriifPKfPi(i32 %0, i32 %1, float %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul nsw i32 %6, %1
  %8 = mul nsw i32 %7, 3
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %3, i64 %9
  %11 = shl nsw i32 %7, 5
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %12
  %14 = fmul contract float %2, %2
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %16 = icmp slt i32 %15, %1
  br i1 %16, label %17, label %25

17:                                               ; preds = %5
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = insertelement <32 x float> poison, float %14, i64 0
  %24 = shufflevector <32 x float> %23, <32 x float> poison, <32 x i32> zeroinitializer
  br label %26

25:                                               ; preds = %136, %5
  ret void

26:                                               ; preds = %17, %136
  %27 = phi i32 [ %15, %17 ], [ %137, %136 ]
  %28 = mul nsw i32 %27, 3
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %10, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = add nsw i32 %28, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %10, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = add nsw i32 %28, 2
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %10, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !6
  %40 = shl nsw i32 %27, 5
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %41
  store i32 %27, i32 addrspace(1)* %42, align 4, !tbaa !11
  %43 = add nuw nsw i32 %40, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %44
  store i32 %27, i32 addrspace(1)* %45, align 4, !tbaa !11
  %46 = add nuw nsw i32 %40, 2
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %47
  store i32 %27, i32 addrspace(1)* %48, align 4, !tbaa !11
  %49 = add nuw nsw i32 %40, 3
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %50
  store i32 %27, i32 addrspace(1)* %51, align 4, !tbaa !11
  %52 = add nuw nsw i32 %40, 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %53
  store i32 %27, i32 addrspace(1)* %54, align 4, !tbaa !11
  %55 = add nuw nsw i32 %40, 5
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %56
  store i32 %27, i32 addrspace(1)* %57, align 4, !tbaa !11
  %58 = add nuw nsw i32 %40, 6
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %59
  store i32 %27, i32 addrspace(1)* %60, align 4, !tbaa !11
  %61 = add nuw nsw i32 %40, 7
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %62
  store i32 %27, i32 addrspace(1)* %63, align 4, !tbaa !11
  %64 = add nuw nsw i32 %40, 8
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %65
  store i32 %27, i32 addrspace(1)* %66, align 4, !tbaa !11
  %67 = add nuw nsw i32 %40, 9
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %68
  store i32 %27, i32 addrspace(1)* %69, align 4, !tbaa !11
  %70 = add nuw nsw i32 %40, 10
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %71
  store i32 %27, i32 addrspace(1)* %72, align 4, !tbaa !11
  %73 = add nuw nsw i32 %40, 11
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %74
  store i32 %27, i32 addrspace(1)* %75, align 4, !tbaa !11
  %76 = add nuw nsw i32 %40, 12
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %77
  store i32 %27, i32 addrspace(1)* %78, align 4, !tbaa !11
  %79 = add nuw nsw i32 %40, 13
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %80
  store i32 %27, i32 addrspace(1)* %81, align 4, !tbaa !11
  %82 = add nuw nsw i32 %40, 14
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %83
  store i32 %27, i32 addrspace(1)* %84, align 4, !tbaa !11
  %85 = add nuw nsw i32 %40, 15
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %86
  store i32 %27, i32 addrspace(1)* %87, align 4, !tbaa !11
  %88 = add nuw nsw i32 %40, 16
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %89
  store i32 %27, i32 addrspace(1)* %90, align 4, !tbaa !11
  %91 = add nuw nsw i32 %40, 17
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %92
  store i32 %27, i32 addrspace(1)* %93, align 4, !tbaa !11
  %94 = add nuw nsw i32 %40, 18
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %95
  store i32 %27, i32 addrspace(1)* %96, align 4, !tbaa !11
  %97 = add nuw nsw i32 %40, 19
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %98
  store i32 %27, i32 addrspace(1)* %99, align 4, !tbaa !11
  %100 = add nuw nsw i32 %40, 20
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %101
  store i32 %27, i32 addrspace(1)* %102, align 4, !tbaa !11
  %103 = add nuw nsw i32 %40, 21
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %104
  store i32 %27, i32 addrspace(1)* %105, align 4, !tbaa !11
  %106 = add nuw nsw i32 %40, 22
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %107
  store i32 %27, i32 addrspace(1)* %108, align 4, !tbaa !11
  %109 = add nuw nsw i32 %40, 23
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %110
  store i32 %27, i32 addrspace(1)* %111, align 4, !tbaa !11
  %112 = add nuw nsw i32 %40, 24
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %113
  store i32 %27, i32 addrspace(1)* %114, align 4, !tbaa !11
  %115 = add nuw nsw i32 %40, 25
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %116
  store i32 %27, i32 addrspace(1)* %117, align 4, !tbaa !11
  %118 = add nuw nsw i32 %40, 26
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %119
  store i32 %27, i32 addrspace(1)* %120, align 4, !tbaa !11
  %121 = add nuw nsw i32 %40, 27
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %122
  store i32 %27, i32 addrspace(1)* %123, align 4, !tbaa !11
  %124 = add nuw nsw i32 %40, 28
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %125
  store i32 %27, i32 addrspace(1)* %126, align 4, !tbaa !11
  %127 = add nuw nsw i32 %40, 29
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %128
  store i32 %27, i32 addrspace(1)* %129, align 4, !tbaa !11
  %130 = add nuw nsw i32 %40, 30
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %131
  store i32 %27, i32 addrspace(1)* %132, align 4, !tbaa !11
  %133 = add nuw nsw i32 %40, 31
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %134
  store i32 %27, i32 addrspace(1)* %135, align 4, !tbaa !11
  br label %139

136:                                              ; preds = %215
  %137 = add i32 %27, %22
  %138 = icmp slt i32 %137, %1
  br i1 %138, label %26, label %25, !llvm.loop !13

139:                                              ; preds = %26, %215
  %140 = phi i32 [ 0, %26 ], [ %217, %215 ]
  %141 = phi <32 x float> [ %24, %26 ], [ %216, %215 ]
  %142 = icmp eq i32 %27, %140
  br i1 %142, label %215, label %143

143:                                              ; preds = %139
  %144 = mul nsw i32 %140, 3
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %10, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !6
  %148 = add nuw nsw i32 %144, 1
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %10, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !6
  %152 = add nuw nsw i32 %144, 2
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %10, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !6
  %156 = fsub contract float %31, %147
  %157 = fmul contract float %156, %156
  %158 = fsub contract float %35, %151
  %159 = fmul contract float %158, %158
  %160 = fadd contract float %157, %159
  %161 = fsub contract float %39, %155
  %162 = fmul contract float %161, %161
  %163 = fadd contract float %160, %162
  %164 = fcmp contract ogt float %163, %14
  br i1 %164, label %215, label %165

165:                                              ; preds = %143
  %166 = fcmp contract ogt float %147, %31
  %167 = fcmp contract ogt float %151, %35
  %168 = fcmp contract ogt float %155, %39
  %169 = select i1 %166, i32 16, i32 0
  %170 = select i1 %167, i32 8, i32 0
  %171 = or i32 %170, %169
  %172 = select i1 %168, i32 4, i32 0
  %173 = or i32 %171, %172
  %174 = extractelement <32 x float> %141, i32 %173
  %175 = fcmp contract olt float %163, %174
  br i1 %175, label %176, label %203

176:                                              ; preds = %211, %207, %203, %165
  %177 = phi i1 [ false, %211 ], [ true, %207 ], [ true, %203 ], [ true, %165 ]
  %178 = phi i32 [ 3, %211 ], [ 2, %207 ], [ 1, %203 ], [ 0, %165 ]
  %179 = phi i32 [ %212, %211 ], [ %208, %207 ], [ %204, %203 ], [ %173, %165 ]
  %180 = or i32 %173, %40
  br i1 %177, label %187, label %181

181:                                              ; preds = %187, %176
  %182 = phi <32 x float> [ %141, %176 ], [ %200, %187 ]
  %183 = or i32 %180, %178
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %184
  store i32 %140, i32 addrspace(1)* %185, align 4, !tbaa !11
  %186 = insertelement <32 x float> %182, float %163, i32 %179
  br label %215

187:                                              ; preds = %176, %187
  %188 = phi i32 [ %201, %187 ], [ 3, %176 ]
  %189 = phi <32 x float> [ %200, %187 ], [ %141, %176 ]
  %190 = add nuw nsw i32 %180, %188
  %191 = add nsw i32 %190, -1
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %192
  %194 = load i32, i32 addrspace(1)* %193, align 4, !tbaa !11
  %195 = sext i32 %190 to i64
  %196 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %195
  store i32 %194, i32 addrspace(1)* %196, align 4, !tbaa !11
  %197 = add nuw nsw i32 %188, %173
  %198 = add nsw i32 %197, -1
  %199 = extractelement <32 x float> %189, i32 %198
  %200 = insertelement <32 x float> %189, float %199, i32 %197
  %201 = add nsw i32 %188, -1
  %202 = icmp ugt i32 %201, %178
  br i1 %202, label %187, label %181, !llvm.loop !15

203:                                              ; preds = %165
  %204 = or i32 %173, 1
  %205 = extractelement <32 x float> %141, i32 %204
  %206 = fcmp contract olt float %163, %205
  br i1 %206, label %176, label %207

207:                                              ; preds = %203
  %208 = or i32 %173, 2
  %209 = extractelement <32 x float> %141, i32 %208
  %210 = fcmp contract olt float %163, %209
  br i1 %210, label %176, label %211

211:                                              ; preds = %207
  %212 = or i32 %173, 3
  %213 = extractelement <32 x float> %141, i32 %212
  %214 = fcmp contract olt float %163, %213
  br i1 %214, label %176, label %215

215:                                              ; preds = %211, %143, %181, %139
  %216 = phi <32 x float> [ %141, %139 ], [ %141, %143 ], [ %186, %181 ], [ %141, %211 ]
  %217 = add nuw nsw i32 %140, 1
  %218 = icmp eq i32 %217, %1
  br i1 %218, label %136, label %139, !llvm.loop !16
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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
