; ModuleID = '../data/hip_kernels/336/1/main.cu'
source_filename = "../data/hip_kernels/336/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13matMultiply2DPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %164

25:                                               ; preds = %4
  %26 = icmp eq i32 %3, 0
  br i1 %26, label %56, label %27

27:                                               ; preds = %25
  %28 = mul nsw i32 %13, %3
  %29 = and i32 %3, 7
  %30 = icmp ult i32 %3, 8
  br i1 %30, label %33, label %31

31:                                               ; preds = %27
  %32 = and i32 %3, -8
  br label %62

33:                                               ; preds = %62, %27
  %34 = phi float [ undef, %27 ], [ %160, %62 ]
  %35 = phi i32 [ 0, %27 ], [ %161, %62 ]
  %36 = phi float [ 0.000000e+00, %27 ], [ %160, %62 ]
  %37 = icmp eq i32 %29, 0
  br i1 %37, label %56, label %38

38:                                               ; preds = %33, %38
  %39 = phi i32 [ %53, %38 ], [ %35, %33 ]
  %40 = phi float [ %52, %38 ], [ %36, %33 ]
  %41 = phi i32 [ %54, %38 ], [ 0, %33 ]
  %42 = add i32 %39, %28
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !6
  %46 = mul i32 %39, %3
  %47 = add i32 %46, %21
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !6
  %51 = fmul contract float %45, %50
  %52 = fadd contract float %40, %51
  %53 = add nuw i32 %39, 1
  %54 = add i32 %41, 1
  %55 = icmp eq i32 %54, %29
  br i1 %55, label %56, label %38, !llvm.loop !11

56:                                               ; preds = %33, %38, %25
  %57 = phi i32 [ 0, %25 ], [ %28, %38 ], [ %28, %33 ]
  %58 = phi float [ 0.000000e+00, %25 ], [ %34, %33 ], [ %52, %38 ]
  %59 = add nsw i32 %57, %21
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  store float %58, float addrspace(1)* %61, align 4, !tbaa !7
  br label %164

62:                                               ; preds = %62, %31
  %63 = phi i32 [ 0, %31 ], [ %161, %62 ]
  %64 = phi float [ 0.000000e+00, %31 ], [ %160, %62 ]
  %65 = phi i32 [ 0, %31 ], [ %162, %62 ]
  %66 = add i32 %63, %28
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !6
  %70 = mul i32 %63, %3
  %71 = add i32 %70, %21
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !6
  %75 = fmul contract float %69, %74
  %76 = fadd contract float %64, %75
  %77 = or i32 %63, 1
  %78 = add i32 %77, %28
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !6
  %82 = mul i32 %77, %3
  %83 = add i32 %82, %21
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %87 = fmul contract float %81, %86
  %88 = fadd contract float %76, %87
  %89 = or i32 %63, 2
  %90 = add i32 %89, %28
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !6
  %94 = mul i32 %89, %3
  %95 = add i32 %94, %21
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !6
  %99 = fmul contract float %93, %98
  %100 = fadd contract float %88, %99
  %101 = or i32 %63, 3
  %102 = add i32 %101, %28
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !6
  %106 = mul i32 %101, %3
  %107 = add i32 %106, %21
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !6
  %111 = fmul contract float %105, %110
  %112 = fadd contract float %100, %111
  %113 = or i32 %63, 4
  %114 = add i32 %113, %28
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !6
  %118 = mul i32 %113, %3
  %119 = add i32 %118, %21
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !6
  %123 = fmul contract float %117, %122
  %124 = fadd contract float %112, %123
  %125 = or i32 %63, 5
  %126 = add i32 %125, %28
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !6
  %130 = mul i32 %125, %3
  %131 = add i32 %130, %21
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !6
  %135 = fmul contract float %129, %134
  %136 = fadd contract float %124, %135
  %137 = or i32 %63, 6
  %138 = add i32 %137, %28
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %0, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7, !amdgpu.noclobber !6
  %142 = mul i32 %137, %3
  %143 = add i32 %142, %21
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !6
  %147 = fmul contract float %141, %146
  %148 = fadd contract float %136, %147
  %149 = or i32 %63, 7
  %150 = add i32 %149, %28
  %151 = zext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !6
  %154 = mul i32 %149, %3
  %155 = add i32 %154, %21
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %1, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !6
  %159 = fmul contract float %153, %158
  %160 = fadd contract float %148, %159
  %161 = add nuw i32 %63, 8
  %162 = add i32 %65, 8
  %163 = icmp eq i32 %162, %32
  br i1 %163, label %33, label %62, !llvm.loop !13

164:                                              ; preds = %56, %4
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
