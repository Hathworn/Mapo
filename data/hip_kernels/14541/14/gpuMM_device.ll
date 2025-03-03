; ModuleID = '../data/hip_kernels/14541/14/main.cu'
source_filename = "../data/hip_kernels/14541/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5gpuMMPdS_S_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp sgt i32 %3, 0
  %23 = mul nsw i32 %13, %3
  br i1 %22, label %24, label %57

24:                                               ; preds = %4
  %25 = and i32 %3, 7
  %26 = icmp ult i32 %3, 8
  br i1 %26, label %29, label %27

27:                                               ; preds = %24
  %28 = and i32 %3, -8
  br label %62

29:                                               ; preds = %62, %24
  %30 = phi float [ undef, %24 ], [ %176, %62 ]
  %31 = phi i32 [ 0, %24 ], [ %177, %62 ]
  %32 = phi float [ 0.000000e+00, %24 ], [ %176, %62 ]
  %33 = icmp eq i32 %25, 0
  br i1 %33, label %54, label %34

34:                                               ; preds = %29, %34
  %35 = phi i32 [ %51, %34 ], [ %31, %29 ]
  %36 = phi float [ %50, %34 ], [ %32, %29 ]
  %37 = phi i32 [ %52, %34 ], [ 0, %29 ]
  %38 = add nsw i32 %35, %23
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %0, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7, !amdgpu.noclobber !5
  %42 = mul nsw i32 %35, %3
  %43 = add nsw i32 %42, %21
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %1, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7, !amdgpu.noclobber !5
  %47 = fmul contract double %41, %46
  %48 = fpext float %36 to double
  %49 = fadd contract double %47, %48
  %50 = fptrunc double %49 to float
  %51 = add nuw nsw i32 %35, 1
  %52 = add i32 %37, 1
  %53 = icmp eq i32 %52, %25
  br i1 %53, label %54, label %34, !llvm.loop !11

54:                                               ; preds = %34, %29
  %55 = phi float [ %30, %29 ], [ %50, %34 ]
  %56 = fpext float %55 to double
  br label %57

57:                                               ; preds = %4, %54
  %58 = phi double [ %56, %54 ], [ 0.000000e+00, %4 ]
  %59 = add nsw i32 %23, %21
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %2, i64 %60
  store double %58, double addrspace(1)* %61, align 8, !tbaa !7
  ret void

62:                                               ; preds = %62, %27
  %63 = phi i32 [ 0, %27 ], [ %177, %62 ]
  %64 = phi float [ 0.000000e+00, %27 ], [ %176, %62 ]
  %65 = phi i32 [ 0, %27 ], [ %178, %62 ]
  %66 = add nsw i32 %63, %23
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %0, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7, !amdgpu.noclobber !5
  %70 = mul nsw i32 %63, %3
  %71 = add nsw i32 %70, %21
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %1, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !7, !amdgpu.noclobber !5
  %75 = fmul contract double %69, %74
  %76 = fpext float %64 to double
  %77 = fadd contract double %75, %76
  %78 = fptrunc double %77 to float
  %79 = or i32 %63, 1
  %80 = add nsw i32 %79, %23
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %0, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !7, !amdgpu.noclobber !5
  %84 = mul nsw i32 %79, %3
  %85 = add nsw i32 %84, %21
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %1, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7, !amdgpu.noclobber !5
  %89 = fmul contract double %83, %88
  %90 = fpext float %78 to double
  %91 = fadd contract double %89, %90
  %92 = fptrunc double %91 to float
  %93 = or i32 %63, 2
  %94 = add nsw i32 %93, %23
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, double addrspace(1)* %0, i64 %95
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !7, !amdgpu.noclobber !5
  %98 = mul nsw i32 %93, %3
  %99 = add nsw i32 %98, %21
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %1, i64 %100
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !7, !amdgpu.noclobber !5
  %103 = fmul contract double %97, %102
  %104 = fpext float %92 to double
  %105 = fadd contract double %103, %104
  %106 = fptrunc double %105 to float
  %107 = or i32 %63, 3
  %108 = add nsw i32 %107, %23
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds double, double addrspace(1)* %0, i64 %109
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !7, !amdgpu.noclobber !5
  %112 = mul nsw i32 %107, %3
  %113 = add nsw i32 %112, %21
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %1, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !7, !amdgpu.noclobber !5
  %117 = fmul contract double %111, %116
  %118 = fpext float %106 to double
  %119 = fadd contract double %117, %118
  %120 = fptrunc double %119 to float
  %121 = or i32 %63, 4
  %122 = add nsw i32 %121, %23
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds double, double addrspace(1)* %0, i64 %123
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !7, !amdgpu.noclobber !5
  %126 = mul nsw i32 %121, %3
  %127 = add nsw i32 %126, %21
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds double, double addrspace(1)* %1, i64 %128
  %130 = load double, double addrspace(1)* %129, align 8, !tbaa !7, !amdgpu.noclobber !5
  %131 = fmul contract double %125, %130
  %132 = fpext float %120 to double
  %133 = fadd contract double %131, %132
  %134 = fptrunc double %133 to float
  %135 = or i32 %63, 5
  %136 = add nsw i32 %135, %23
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds double, double addrspace(1)* %0, i64 %137
  %139 = load double, double addrspace(1)* %138, align 8, !tbaa !7, !amdgpu.noclobber !5
  %140 = mul nsw i32 %135, %3
  %141 = add nsw i32 %140, %21
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds double, double addrspace(1)* %1, i64 %142
  %144 = load double, double addrspace(1)* %143, align 8, !tbaa !7, !amdgpu.noclobber !5
  %145 = fmul contract double %139, %144
  %146 = fpext float %134 to double
  %147 = fadd contract double %145, %146
  %148 = fptrunc double %147 to float
  %149 = or i32 %63, 6
  %150 = add nsw i32 %149, %23
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds double, double addrspace(1)* %0, i64 %151
  %153 = load double, double addrspace(1)* %152, align 8, !tbaa !7, !amdgpu.noclobber !5
  %154 = mul nsw i32 %149, %3
  %155 = add nsw i32 %154, %21
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds double, double addrspace(1)* %1, i64 %156
  %158 = load double, double addrspace(1)* %157, align 8, !tbaa !7, !amdgpu.noclobber !5
  %159 = fmul contract double %153, %158
  %160 = fpext float %148 to double
  %161 = fadd contract double %159, %160
  %162 = fptrunc double %161 to float
  %163 = or i32 %63, 7
  %164 = add nsw i32 %163, %23
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds double, double addrspace(1)* %0, i64 %165
  %167 = load double, double addrspace(1)* %166, align 8, !tbaa !7, !amdgpu.noclobber !5
  %168 = mul nsw i32 %163, %3
  %169 = add nsw i32 %168, %21
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds double, double addrspace(1)* %1, i64 %170
  %172 = load double, double addrspace(1)* %171, align 8, !tbaa !7, !amdgpu.noclobber !5
  %173 = fmul contract double %167, %172
  %174 = fpext float %162 to double
  %175 = fadd contract double %173, %174
  %176 = fptrunc double %175 to float
  %177 = add nuw nsw i32 %63, 8
  %178 = add i32 %65, 8
  %179 = icmp eq i32 %178, %28
  br i1 %179, label %29, label %62, !llvm.loop !13
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
