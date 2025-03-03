; ModuleID = '../data/hip_kernels/2890/31/main.cu'
source_filename = "../data/hip_kernels/2890/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17Dx_Forward_KernelPfPKfiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp slt i32 %14, %2
  %24 = icmp slt i32 %22, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %209

26:                                               ; preds = %5
  %27 = mul nsw i32 %22, %2
  %28 = add nsw i32 %27, %14
  %29 = add nsw i32 %2, -1
  %30 = icmp eq i32 %14, %29
  %31 = icmp sgt i32 %4, 0
  br i1 %30, label %41, label %32

32:                                               ; preds = %26
  br i1 %31, label %33, label %209

33:                                               ; preds = %32
  %34 = add nsw i32 %28, 1
  %35 = mul nsw i32 %34, %4
  %36 = mul nsw i32 %28, %4
  %37 = and i32 %4, 7
  %38 = icmp ult i32 %4, 8
  br i1 %38, label %190, label %39

39:                                               ; preds = %33
  %40 = and i32 %4, -8
  br label %85

41:                                               ; preds = %26
  br i1 %31, label %42, label %209

42:                                               ; preds = %41
  %43 = mul nsw i32 %28, %4
  %44 = and i32 %4, 7
  %45 = icmp ult i32 %4, 8
  br i1 %45, label %178, label %46

46:                                               ; preds = %42
  %47 = and i32 %4, -8
  br label %48

48:                                               ; preds = %48, %46
  %49 = phi i32 [ 0, %46 ], [ %82, %48 ]
  %50 = phi i32 [ 0, %46 ], [ %83, %48 ]
  %51 = add nsw i32 %49, %43
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  store float 0.000000e+00, float addrspace(1)* %53, align 4, !tbaa !7
  %54 = or i32 %49, 1
  %55 = add nsw i32 %54, %43
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  store float 0.000000e+00, float addrspace(1)* %57, align 4, !tbaa !7
  %58 = or i32 %49, 2
  %59 = add nsw i32 %58, %43
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  store float 0.000000e+00, float addrspace(1)* %61, align 4, !tbaa !7
  %62 = or i32 %49, 3
  %63 = add nsw i32 %62, %43
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  store float 0.000000e+00, float addrspace(1)* %65, align 4, !tbaa !7
  %66 = or i32 %49, 4
  %67 = add nsw i32 %66, %43
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  store float 0.000000e+00, float addrspace(1)* %69, align 4, !tbaa !7
  %70 = or i32 %49, 5
  %71 = add nsw i32 %70, %43
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  store float 0.000000e+00, float addrspace(1)* %73, align 4, !tbaa !7
  %74 = or i32 %49, 6
  %75 = add nsw i32 %74, %43
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  store float 0.000000e+00, float addrspace(1)* %77, align 4, !tbaa !7
  %78 = or i32 %49, 7
  %79 = add nsw i32 %78, %43
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  store float 0.000000e+00, float addrspace(1)* %81, align 4, !tbaa !7
  %82 = add nuw nsw i32 %49, 8
  %83 = add i32 %50, 8
  %84 = icmp eq i32 %83, %47
  br i1 %84, label %178, label %48, !llvm.loop !11

85:                                               ; preds = %85, %39
  %86 = phi i32 [ 0, %39 ], [ %175, %85 ]
  %87 = phi i32 [ 0, %39 ], [ %176, %85 ]
  %88 = add nsw i32 %86, %35
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = add nsw i32 %86, %36
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = fsub contract float %91, %95
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  store float %96, float addrspace(1)* %97, align 4, !tbaa !7
  %98 = or i32 %86, 1
  %99 = add nsw i32 %98, %35
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = add nsw i32 %98, %36
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = fsub contract float %102, %106
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  store float %107, float addrspace(1)* %108, align 4, !tbaa !7
  %109 = or i32 %86, 2
  %110 = add nsw i32 %109, %35
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7
  %114 = add nsw i32 %109, %36
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = fsub contract float %113, %117
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  store float %118, float addrspace(1)* %119, align 4, !tbaa !7
  %120 = or i32 %86, 3
  %121 = add nsw i32 %120, %35
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7
  %125 = add nsw i32 %120, %36
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %129 = fsub contract float %124, %128
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  store float %129, float addrspace(1)* %130, align 4, !tbaa !7
  %131 = or i32 %86, 4
  %132 = add nsw i32 %131, %35
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7
  %136 = add nsw i32 %131, %36
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %140 = fsub contract float %135, %139
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  store float %140, float addrspace(1)* %141, align 4, !tbaa !7
  %142 = or i32 %86, 5
  %143 = add nsw i32 %142, %35
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %147 = add nsw i32 %142, %36
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7
  %151 = fsub contract float %146, %150
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  store float %151, float addrspace(1)* %152, align 4, !tbaa !7
  %153 = or i32 %86, 6
  %154 = add nsw i32 %153, %35
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %1, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7
  %158 = add nsw i32 %153, %36
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7
  %162 = fsub contract float %157, %161
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %159
  store float %162, float addrspace(1)* %163, align 4, !tbaa !7
  %164 = or i32 %86, 7
  %165 = add nsw i32 %164, %35
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %1, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7
  %169 = add nsw i32 %164, %36
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %1, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7
  %173 = fsub contract float %168, %172
  %174 = getelementptr inbounds float, float addrspace(1)* %0, i64 %170
  store float %173, float addrspace(1)* %174, align 4, !tbaa !7
  %175 = add nuw nsw i32 %86, 8
  %176 = add i32 %87, 8
  %177 = icmp eq i32 %176, %40
  br i1 %177, label %190, label %85, !llvm.loop !13

178:                                              ; preds = %48, %42
  %179 = phi i32 [ 0, %42 ], [ %82, %48 ]
  %180 = icmp eq i32 %44, 0
  br i1 %180, label %209, label %181

181:                                              ; preds = %178, %181
  %182 = phi i32 [ %187, %181 ], [ %179, %178 ]
  %183 = phi i32 [ %188, %181 ], [ 0, %178 ]
  %184 = add nsw i32 %182, %43
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %0, i64 %185
  store float 0.000000e+00, float addrspace(1)* %186, align 4, !tbaa !7
  %187 = add nuw nsw i32 %182, 1
  %188 = add i32 %183, 1
  %189 = icmp eq i32 %188, %44
  br i1 %189, label %209, label %181, !llvm.loop !14

190:                                              ; preds = %85, %33
  %191 = phi i32 [ 0, %33 ], [ %175, %85 ]
  %192 = icmp eq i32 %37, 0
  br i1 %192, label %209, label %193

193:                                              ; preds = %190, %193
  %194 = phi i32 [ %206, %193 ], [ %191, %190 ]
  %195 = phi i32 [ %207, %193 ], [ 0, %190 ]
  %196 = add nsw i32 %194, %35
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %1, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !7
  %200 = add nsw i32 %194, %36
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %1, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !7
  %204 = fsub contract float %199, %203
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 %201
  store float %204, float addrspace(1)* %205, align 4, !tbaa !7
  %206 = add nuw nsw i32 %194, 1
  %207 = add i32 %195, 1
  %208 = icmp eq i32 %207, %37
  br i1 %208, label %209, label %193, !llvm.loop !16

209:                                              ; preds = %190, %193, %178, %181, %32, %41, %5
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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !15}
