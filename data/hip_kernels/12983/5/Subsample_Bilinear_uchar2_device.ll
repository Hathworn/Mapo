; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/12983/5/Subsample_Bilinear_uchar2.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/12983/5/Subsample_Bilinear_uchar2.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x i8> }

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z25Subsample_Bilinear_uchar2P13__hip_textureP15HIP_vector_typeIhLj2EEiiiii(%struct.__hip_texture addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  %25 = icmp slt i32 %24, %3
  %26 = icmp slt i32 %16, %2
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %146

28:                                               ; preds = %7
  %29 = sitofp i32 %5 to float
  %30 = sitofp i32 %2 to float
  %31 = fdiv contract float %29, %30
  %32 = sitofp i32 %6 to float
  %33 = sitofp i32 %3 to float
  %34 = fdiv contract float %32, %33
  %35 = sitofp i32 %16 to float
  %36 = fadd contract float %35, 5.000000e-01
  %37 = fmul contract float %31, %36
  %38 = sitofp i32 %24 to float
  %39 = fadd contract float %38, 5.000000e-01
  %40 = fmul contract float %34, %39
  %41 = fadd contract float %31, -1.000000e+00
  %42 = fmul contract float %41, 5.000000e-01
  %43 = tail call float @llvm.maxnum.f32(float %42, float 0.000000e+00)
  %44 = tail call float @llvm.minnum.f32(float %43, float 1.000000e+00)
  %45 = fadd contract float %34, -1.000000e+00
  %46 = fmul contract float %45, 5.000000e-01
  %47 = tail call float @llvm.maxnum.f32(float %46, float 0.000000e+00)
  %48 = tail call float @llvm.minnum.f32(float %47, float 1.000000e+00)
  %49 = fadd contract float %44, 5.000000e-01
  %50 = fdiv contract float %44, %49
  %51 = fadd contract float %48, 5.000000e-01
  %52 = fdiv contract float %48, %51
  %53 = fsub contract float %37, %50
  %54 = fsub contract float %40, %52
  %55 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %56 = addrspacecast i32 addrspace(1)* %55 to i32 addrspace(4)*
  %57 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 12
  %58 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 10
  %59 = load i32, i32 addrspace(4)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = uitofp i32 %59 to float
  %61 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 2
  %62 = load i32, i32 addrspace(4)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = lshr i32 %62, 14
  %64 = and i32 %63, 16383
  %65 = add nuw nsw i32 %64, 1
  %66 = uitofp i32 %65 to float
  %67 = load i32, i32 addrspace(4)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = and i32 %67, 32768
  %69 = icmp eq i32 %68, 0
  %70 = select i1 %69, float %60, float 1.000000e+00
  %71 = select i1 %69, float %66, float 1.000000e+00
  %72 = getelementptr inbounds i32, i32 addrspace(4)* %56, i64 14
  %73 = load i32, i32 addrspace(4)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = and i32 %73, 1048576
  %75 = icmp eq i32 %74, 0
  %76 = bitcast i32 addrspace(4)* %57 to <4 x i32> addrspace(4)*
  %77 = load <4 x i32>, <4 x i32> addrspace(4)* %76, align 16, !tbaa !11, !amdgpu.noclobber !5
  %78 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %79 = addrspacecast <8 x i32> addrspace(1)* %78 to <8 x i32> addrspace(4)*
  %80 = load <8 x i32>, <8 x i32> addrspace(4)* %79, align 32, !tbaa !11, !amdgpu.noclobber !5
  %81 = tail call float @llvm.amdgcn.rcp.f32(float %71)
  %82 = fmul float %54, %71
  %83 = tail call float @llvm.floor.f32(float %82)
  %84 = fmul float %81, %83
  %85 = select i1 %75, float %84, float %54
  %86 = tail call float @llvm.amdgcn.rcp.f32(float %70)
  %87 = fmul float %53, %70
  %88 = tail call float @llvm.floor.f32(float %87)
  %89 = fmul float %86, %88
  %90 = select i1 %75, float %89, float %53
  %91 = tail call <2 x float> @llvm.amdgcn.image.sample.lz.2d.v2f32.f32(i32 3, float %90, float %85, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %92 = shufflevector <2 x float> %91, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %93 = bitcast <4 x float> %92 to <8 x i16>
  %94 = extractelement <8 x i16> %93, i64 2
  %95 = extractelement <8 x i16> %93, i64 0
  %96 = and i16 %94, 255
  %97 = fadd contract float %50, %37
  %98 = fmul float %97, %70
  %99 = tail call float @llvm.floor.f32(float %98)
  %100 = fmul float %86, %99
  %101 = select i1 %75, float %100, float %97
  %102 = tail call <2 x float> @llvm.amdgcn.image.sample.lz.2d.v2f32.f32(i32 3, float %101, float %85, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %103 = shufflevector <2 x float> %102, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %104 = bitcast <4 x float> %103 to <8 x i16>
  %105 = extractelement <8 x i16> %104, i64 2
  %106 = extractelement <8 x i16> %104, i64 0
  %107 = and i16 %105, 255
  %108 = fadd contract float %52, %40
  %109 = fmul float %108, %71
  %110 = tail call float @llvm.floor.f32(float %109)
  %111 = fmul float %81, %110
  %112 = select i1 %75, float %111, float %108
  %113 = tail call <2 x float> @llvm.amdgcn.image.sample.lz.2d.v2f32.f32(i32 3, float %90, float %112, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %114 = shufflevector <2 x float> %113, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %115 = bitcast <4 x float> %114 to <8 x i16>
  %116 = extractelement <8 x i16> %115, i64 2
  %117 = extractelement <8 x i16> %115, i64 0
  %118 = and i16 %116, 255
  %119 = tail call <2 x float> @llvm.amdgcn.image.sample.lz.2d.v2f32.f32(i32 3, float %101, float %112, <8 x i32> %80, <4 x i32> %77, i1 false, i32 0, i32 0)
  %120 = shufflevector <2 x float> %119, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %121 = bitcast <4 x float> %120 to <8 x i16>
  %122 = extractelement <8 x i16> %121, i64 2
  %123 = extractelement <8 x i16> %121, i64 0
  %124 = and i16 %122, 255
  %125 = and i16 %95, 255
  %126 = and i16 %106, 255
  %127 = and i16 %117, 255
  %128 = and i16 %123, 255
  %129 = add nuw nsw i16 %125, 2
  %130 = add nuw nsw i16 %129, %126
  %131 = add nuw nsw i16 %130, %127
  %132 = add nuw nsw i16 %131, %128
  %133 = lshr i16 %132, 2
  %134 = add nuw nsw i16 %107, %96
  %135 = add nuw nsw i16 %134, %118
  %136 = add nuw nsw i16 %135, %124
  %137 = shl nuw i16 %136, 6
  %138 = add nuw i16 %137, 128
  %139 = and i16 %138, -256
  %140 = or i16 %139, %133
  %141 = mul nsw i32 %24, %4
  %142 = add nsw i32 %141, %16
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %143
  %145 = bitcast %struct.HIP_vector_type addrspace(1)* %144 to i16 addrspace(1)*
  store i16 %140, i16 addrspace(1)* %145, align 2
  br label %146

146:                                              ; preds = %28, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nounwind readonly willreturn
declare <2 x float> @llvm.amdgcn.image.sample.lz.2d.v2f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

attributes #0 = { mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readonly willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
