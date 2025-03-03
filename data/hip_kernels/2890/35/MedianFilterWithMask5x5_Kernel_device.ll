; ModuleID = '../data/hip_kernels/2890/35/main.cu'
source_filename = "../data/hip_kernels/2890/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z30MedianFilterWithMask5x5_KernelPfPKfiiiPKb(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i8 addrspace(1)* nocapture readonly %5) local_unnamed_addr #1 {
  %7 = alloca [25 x float], align 16, addrspace(5)
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %17
  %25 = icmp slt i32 %16, %2
  %26 = icmp slt i32 %24, %3
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %202

28:                                               ; preds = %6
  %29 = mul nsw i32 %24, %2
  %30 = add nsw i32 %29, %16
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %31
  %33 = load i8, i8 addrspace(1)* %32, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !6
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %96, label %35

35:                                               ; preds = %28
  %36 = icmp sgt i32 %4, 0
  br i1 %36, label %37, label %202

37:                                               ; preds = %35
  %38 = mul nsw i32 %30, %4
  %39 = and i32 %4, 7
  %40 = icmp ult i32 %4, 8
  br i1 %40, label %188, label %41

41:                                               ; preds = %37
  %42 = and i32 %4, -8
  br label %43

43:                                               ; preds = %43, %41
  %44 = phi i32 [ 0, %41 ], [ %93, %43 ]
  %45 = phi i32 [ 0, %41 ], [ %94, %43 ]
  %46 = add nsw i32 %44, %38
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !12
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  store float %49, float addrspace(1)* %50, align 4, !tbaa !12
  %51 = or i32 %44, 1
  %52 = add nsw i32 %51, %38
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !12
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  store float %55, float addrspace(1)* %56, align 4, !tbaa !12
  %57 = or i32 %44, 2
  %58 = add nsw i32 %57, %38
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !12
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  store float %61, float addrspace(1)* %62, align 4, !tbaa !12
  %63 = or i32 %44, 3
  %64 = add nsw i32 %63, %38
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !12
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  store float %67, float addrspace(1)* %68, align 4, !tbaa !12
  %69 = or i32 %44, 4
  %70 = add nsw i32 %69, %38
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !12
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  store float %73, float addrspace(1)* %74, align 4, !tbaa !12
  %75 = or i32 %44, 5
  %76 = add nsw i32 %75, %38
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !12
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  store float %79, float addrspace(1)* %80, align 4, !tbaa !12
  %81 = or i32 %44, 6
  %82 = add nsw i32 %81, %38
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !12
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  store float %85, float addrspace(1)* %86, align 4, !tbaa !12
  %87 = or i32 %44, 7
  %88 = add nsw i32 %87, %38
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !12
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  store float %91, float addrspace(1)* %92, align 4, !tbaa !12
  %93 = add nuw nsw i32 %44, 8
  %94 = add i32 %45, 8
  %95 = icmp eq i32 %94, %42
  br i1 %95, label %188, label %43, !llvm.loop !14

96:                                               ; preds = %28
  %97 = bitcast [25 x float] addrspace(5)* %7 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 100, i8 addrspace(5)* %97) #5
  call void @llvm.memset.p5i8.i64(i8 addrspace(5)* noundef align 16 dereferenceable(100) %97, i8 0, i64 100, i1 false)
  %98 = icmp sgt i32 %4, 0
  br i1 %98, label %99, label %115

99:                                               ; preds = %96
  %100 = add nsw i32 %16, -2
  %101 = icmp sgt i32 %16, 1
  %102 = select i1 %101, i32 %100, i32 0
  %103 = add nsw i32 %16, 2
  %104 = add nsw i32 %2, -1
  %105 = tail call i32 @llvm.smin.i32(i32 %103, i32 %104)
  %106 = add nsw i32 %24, -2
  %107 = icmp sgt i32 %24, 1
  %108 = select i1 %107, i32 %106, i32 0
  %109 = add nsw i32 %24, 2
  %110 = add nsw i32 %3, -1
  %111 = tail call i32 @llvm.smin.i32(i32 %109, i32 %110)
  %112 = icmp sgt i32 %108, %111
  %113 = icmp sgt i32 %102, %105
  %114 = mul nsw i32 %30, %4
  br label %116

115:                                              ; preds = %181, %96
  call void @llvm.lifetime.end.p5i8(i64 100, i8 addrspace(5)* %97) #5
  br label %202

116:                                              ; preds = %99, %181
  %117 = phi i32 [ 0, %99 ], [ %186, %181 ]
  br i1 %112, label %123, label %118

118:                                              ; preds = %116, %126
  %119 = phi i32 [ %128, %126 ], [ %108, %116 ]
  %120 = phi i32 [ %127, %126 ], [ 0, %116 ]
  br i1 %113, label %126, label %121

121:                                              ; preds = %118
  %122 = mul nsw i32 %119, %2
  br label %130

123:                                              ; preds = %126, %116
  %124 = phi i32 [ 0, %116 ], [ %127, %126 ]
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %181, label %150

126:                                              ; preds = %146, %118
  %127 = phi i32 [ %120, %118 ], [ %147, %146 ]
  %128 = add nsw i32 %119, 1
  %129 = icmp slt i32 %119, %111
  br i1 %129, label %118, label %123, !llvm.loop !16

130:                                              ; preds = %121, %146
  %131 = phi i32 [ %102, %121 ], [ %148, %146 ]
  %132 = phi i32 [ %120, %121 ], [ %147, %146 ]
  %133 = add nsw i32 %131, %122
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %134
  %136 = load i8, i8 addrspace(1)* %135, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !6
  %137 = icmp eq i8 %136, 0
  br i1 %137, label %146, label %138

138:                                              ; preds = %130
  %139 = mul nsw i32 %133, %4
  %140 = add nsw i32 %139, %117
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %1, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !12
  %144 = add nsw i32 %132, 1
  %145 = getelementptr inbounds [25 x float], [25 x float] addrspace(5)* %7, i32 0, i32 %132
  store float %143, float addrspace(5)* %145, align 4, !tbaa !12
  br label %146

146:                                              ; preds = %138, %130
  %147 = phi i32 [ %144, %138 ], [ %132, %130 ]
  %148 = add nsw i32 %131, 1
  %149 = icmp slt i32 %131, %105
  br i1 %149, label %130, label %126, !llvm.loop !17

150:                                              ; preds = %123
  %151 = add nsw i32 %124, 1
  %152 = sdiv i32 %151, 2
  %153 = icmp sgt i32 %124, 0
  br i1 %153, label %154, label %156

154:                                              ; preds = %150
  %155 = tail call i32 @llvm.smax.i32(i32 %152, i32 1)
  br label %159

156:                                              ; preds = %165, %150
  %157 = getelementptr inbounds [25 x float], [25 x float] addrspace(5)* %7, i32 0, i32 %152
  %158 = load float, float addrspace(5)* %157, align 4, !tbaa !12
  br label %181

159:                                              ; preds = %154, %165
  %160 = phi i32 [ %163, %165 ], [ 0, %154 ]
  %161 = getelementptr inbounds [25 x float], [25 x float] addrspace(5)* %7, i32 0, i32 %160
  %162 = load float, float addrspace(5)* %161, align 4, !tbaa !12
  %163 = add nuw nsw i32 %160, 1
  %164 = icmp slt i32 %163, %124
  br i1 %164, label %170, label %165

165:                                              ; preds = %170, %159
  %166 = phi float [ %162, %159 ], [ %177, %170 ]
  %167 = phi i32 [ %160, %159 ], [ %178, %170 ]
  %168 = getelementptr inbounds [25 x float], [25 x float] addrspace(5)* %7, i32 0, i32 %167
  store float %162, float addrspace(5)* %168, align 4, !tbaa !12
  store float %166, float addrspace(5)* %161, align 4, !tbaa !12
  %169 = icmp eq i32 %163, %155
  br i1 %169, label %156, label %159, !llvm.loop !18

170:                                              ; preds = %159, %170
  %171 = phi i32 [ %179, %170 ], [ %163, %159 ]
  %172 = phi i32 [ %178, %170 ], [ %160, %159 ]
  %173 = phi float [ %177, %170 ], [ %162, %159 ]
  %174 = getelementptr inbounds [25 x float], [25 x float] addrspace(5)* %7, i32 0, i32 %171
  %175 = load float, float addrspace(5)* %174, align 4, !tbaa !12
  %176 = fcmp contract olt float %173, %175
  %177 = select i1 %176, float %175, float %173
  %178 = select i1 %176, i32 %171, i32 %172
  %179 = add nuw nsw i32 %171, 1
  %180 = icmp slt i32 %179, %124
  br i1 %180, label %170, label %165, !llvm.loop !19

181:                                              ; preds = %123, %156
  %182 = phi float [ %158, %156 ], [ 0.000000e+00, %123 ]
  %183 = add nsw i32 %117, %114
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %0, i64 %184
  store float %182, float addrspace(1)* %185, align 4, !tbaa !12
  %186 = add nuw nsw i32 %117, 1
  %187 = icmp eq i32 %186, %4
  br i1 %187, label %115, label %116, !llvm.loop !20

188:                                              ; preds = %43, %37
  %189 = phi i32 [ 0, %37 ], [ %93, %43 ]
  %190 = icmp eq i32 %39, 0
  br i1 %190, label %202, label %191

191:                                              ; preds = %188, %191
  %192 = phi i32 [ %199, %191 ], [ %189, %188 ]
  %193 = phi i32 [ %200, %191 ], [ 0, %188 ]
  %194 = add nsw i32 %192, %38
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds float, float addrspace(1)* %1, i64 %195
  %197 = load float, float addrspace(1)* %196, align 4, !tbaa !12
  %198 = getelementptr inbounds float, float addrspace(1)* %0, i64 %195
  store float %197, float addrspace(1)* %198, align 4, !tbaa !12
  %199 = add nuw nsw i32 %192, 1
  %200 = add i32 %193, 1
  %201 = icmp eq i32 %200, %39
  br i1 %201, label %202, label %191, !llvm.loop !21

202:                                              ; preds = %188, %191, %35, %115, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p5i8.i64(i8 addrspace(5)* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

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
!8 = !{!"bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i8 0, i8 2}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !9, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !15}
!19 = distinct !{!19, !15}
!20 = distinct !{!20, !15}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.unroll.disable"}
