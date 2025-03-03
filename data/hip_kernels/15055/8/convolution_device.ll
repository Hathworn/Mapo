; ModuleID = '../data/hip_kernels/15055/8/main.cu'
source_filename = "../data/hip_kernels/15055/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11convolutionPhS_iiPfiif(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %2
  %27 = icmp slt i32 %25, %3
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %212

29:                                               ; preds = %8
  %30 = icmp sgt i32 %6, 0
  br i1 %30, label %31, label %45

31:                                               ; preds = %29
  %32 = add nsw i32 %6, -1
  %33 = lshr i32 %32, 1
  %34 = add i32 %5, -1
  %35 = sdiv i32 %34, -2
  %36 = add nsw i32 %3, -1
  %37 = sub i32 %25, %33
  %38 = icmp sgt i32 %5, 0
  %39 = add nsw i32 %2, -1
  %40 = add i32 %17, %35
  %41 = and i32 %5, 7
  %42 = icmp ult i32 %5, 8
  %43 = and i32 %5, -8
  %44 = icmp eq i32 %41, 0
  br label %57

45:                                               ; preds = %90, %29
  %46 = phi float [ 0.000000e+00, %29 ], [ %91, %90 ]
  %47 = fpext float %46 to double
  %48 = tail call double @llvm.minnum.f64(double %47, double 2.550000e+02)
  %49 = tail call double @llvm.maxnum.f64(double %48, double 0.000000e+00)
  %50 = fptrunc double %49 to float
  %51 = fdiv contract float %50, %7
  %52 = fptoui float %51 to i8
  %53 = mul nsw i32 %25, %2
  %54 = add nsw i32 %53, %17
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %55
  store i8 %52, i8 addrspace(1)* %56, align 1, !tbaa !7
  br label %212

57:                                               ; preds = %31, %90
  %58 = phi float [ 0.000000e+00, %31 ], [ %91, %90 ]
  %59 = phi i32 [ 0, %31 ], [ %92, %90 ]
  br i1 %38, label %60, label %90

60:                                               ; preds = %57
  %61 = add i32 %37, %59
  %62 = tail call i32 @llvm.smin.i32(i32 %36, i32 %61)
  %63 = tail call i32 @llvm.smax.i32(i32 %62, i32 0)
  %64 = mul nsw i32 %63, %2
  %65 = mul nsw i32 %59, %5
  br i1 %42, label %66, label %94

66:                                               ; preds = %94, %60
  %67 = phi float [ undef, %60 ], [ %208, %94 ]
  %68 = phi float [ %58, %60 ], [ %208, %94 ]
  %69 = phi i32 [ 0, %60 ], [ %209, %94 ]
  br i1 %44, label %90, label %70

70:                                               ; preds = %66, %70
  %71 = phi float [ %86, %70 ], [ %68, %66 ]
  %72 = phi i32 [ %87, %70 ], [ %69, %66 ]
  %73 = phi i32 [ %88, %70 ], [ 0, %66 ]
  %74 = add i32 %40, %72
  %75 = tail call i32 @llvm.smin.i32(i32 %39, i32 %74)
  %76 = tail call i32 @llvm.smax.i32(i32 %75, i32 0)
  %77 = add nsw i32 %76, %64
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %78
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !7, !amdgpu.noclobber !5
  %81 = uitofp i8 %80 to float
  %82 = add nsw i32 %72, %65
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %4, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !10, !amdgpu.noclobber !5
  %86 = tail call float @llvm.fma.f32(float %81, float %85, float %71)
  %87 = add nuw nsw i32 %72, 1
  %88 = add i32 %73, 1
  %89 = icmp eq i32 %88, %41
  br i1 %89, label %90, label %70, !llvm.loop !12

90:                                               ; preds = %66, %70, %57
  %91 = phi float [ %58, %57 ], [ %67, %66 ], [ %86, %70 ]
  %92 = add nuw nsw i32 %59, 1
  %93 = icmp eq i32 %92, %6
  br i1 %93, label %45, label %57, !llvm.loop !14

94:                                               ; preds = %60, %94
  %95 = phi float [ %208, %94 ], [ %58, %60 ]
  %96 = phi i32 [ %209, %94 ], [ 0, %60 ]
  %97 = phi i32 [ %210, %94 ], [ 0, %60 ]
  %98 = add i32 %40, %96
  %99 = tail call i32 @llvm.smin.i32(i32 %39, i32 %98)
  %100 = tail call i32 @llvm.smax.i32(i32 %99, i32 0)
  %101 = add nsw i32 %100, %64
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %102
  %104 = load i8, i8 addrspace(1)* %103, align 1, !tbaa !7, !amdgpu.noclobber !5
  %105 = uitofp i8 %104 to float
  %106 = add nsw i32 %96, %65
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %4, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !10, !amdgpu.noclobber !5
  %110 = tail call float @llvm.fma.f32(float %105, float %109, float %95)
  %111 = or i32 %96, 1
  %112 = add i32 %40, %111
  %113 = tail call i32 @llvm.smin.i32(i32 %39, i32 %112)
  %114 = tail call i32 @llvm.smax.i32(i32 %113, i32 0)
  %115 = add nsw i32 %114, %64
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %116
  %118 = load i8, i8 addrspace(1)* %117, align 1, !tbaa !7, !amdgpu.noclobber !5
  %119 = uitofp i8 %118 to float
  %120 = add nsw i32 %111, %65
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %4, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !10, !amdgpu.noclobber !5
  %124 = tail call float @llvm.fma.f32(float %119, float %123, float %110)
  %125 = or i32 %96, 2
  %126 = add i32 %40, %125
  %127 = tail call i32 @llvm.smin.i32(i32 %39, i32 %126)
  %128 = tail call i32 @llvm.smax.i32(i32 %127, i32 0)
  %129 = add nsw i32 %128, %64
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %130
  %132 = load i8, i8 addrspace(1)* %131, align 1, !tbaa !7, !amdgpu.noclobber !5
  %133 = uitofp i8 %132 to float
  %134 = add nsw i32 %125, %65
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %4, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !10, !amdgpu.noclobber !5
  %138 = tail call float @llvm.fma.f32(float %133, float %137, float %124)
  %139 = or i32 %96, 3
  %140 = add i32 %40, %139
  %141 = tail call i32 @llvm.smin.i32(i32 %39, i32 %140)
  %142 = tail call i32 @llvm.smax.i32(i32 %141, i32 0)
  %143 = add nsw i32 %142, %64
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %144
  %146 = load i8, i8 addrspace(1)* %145, align 1, !tbaa !7, !amdgpu.noclobber !5
  %147 = uitofp i8 %146 to float
  %148 = add nsw i32 %139, %65
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %4, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !10, !amdgpu.noclobber !5
  %152 = tail call float @llvm.fma.f32(float %147, float %151, float %138)
  %153 = or i32 %96, 4
  %154 = add i32 %40, %153
  %155 = tail call i32 @llvm.smin.i32(i32 %39, i32 %154)
  %156 = tail call i32 @llvm.smax.i32(i32 %155, i32 0)
  %157 = add nsw i32 %156, %64
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %158
  %160 = load i8, i8 addrspace(1)* %159, align 1, !tbaa !7, !amdgpu.noclobber !5
  %161 = uitofp i8 %160 to float
  %162 = add nsw i32 %153, %65
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %4, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !10, !amdgpu.noclobber !5
  %166 = tail call float @llvm.fma.f32(float %161, float %165, float %152)
  %167 = or i32 %96, 5
  %168 = add i32 %40, %167
  %169 = tail call i32 @llvm.smin.i32(i32 %39, i32 %168)
  %170 = tail call i32 @llvm.smax.i32(i32 %169, i32 0)
  %171 = add nsw i32 %170, %64
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %172
  %174 = load i8, i8 addrspace(1)* %173, align 1, !tbaa !7, !amdgpu.noclobber !5
  %175 = uitofp i8 %174 to float
  %176 = add nsw i32 %167, %65
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %4, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !10, !amdgpu.noclobber !5
  %180 = tail call float @llvm.fma.f32(float %175, float %179, float %166)
  %181 = or i32 %96, 6
  %182 = add i32 %40, %181
  %183 = tail call i32 @llvm.smin.i32(i32 %39, i32 %182)
  %184 = tail call i32 @llvm.smax.i32(i32 %183, i32 0)
  %185 = add nsw i32 %184, %64
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %186
  %188 = load i8, i8 addrspace(1)* %187, align 1, !tbaa !7, !amdgpu.noclobber !5
  %189 = uitofp i8 %188 to float
  %190 = add nsw i32 %181, %65
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %4, i64 %191
  %193 = load float, float addrspace(1)* %192, align 4, !tbaa !10, !amdgpu.noclobber !5
  %194 = tail call float @llvm.fma.f32(float %189, float %193, float %180)
  %195 = or i32 %96, 7
  %196 = add i32 %40, %195
  %197 = tail call i32 @llvm.smin.i32(i32 %39, i32 %196)
  %198 = tail call i32 @llvm.smax.i32(i32 %197, i32 0)
  %199 = add nsw i32 %198, %64
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %200
  %202 = load i8, i8 addrspace(1)* %201, align 1, !tbaa !7, !amdgpu.noclobber !5
  %203 = uitofp i8 %202 to float
  %204 = add nsw i32 %195, %65
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %4, i64 %205
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !10, !amdgpu.noclobber !5
  %208 = tail call float @llvm.fma.f32(float %203, float %207, float %194)
  %209 = add nuw nsw i32 %96, 8
  %210 = add i32 %97, 8
  %211 = icmp eq i32 %210, %43
  br i1 %211, label %66, label %94, !llvm.loop !16

212:                                              ; preds = %45, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #1

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
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
