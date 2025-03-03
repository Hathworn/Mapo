; ModuleID = '../data/hip_kernels/8562/23/main.cu'
source_filename = "../data/hip_kernels/8562/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s_data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z2k1PfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add nuw nsw i32 %12, 1
  %14 = add i32 %13, %11
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add nuw nsw i32 %21, 1
  %23 = add i32 %22, %20
  %24 = add nsw i32 %3, -1
  %25 = icmp ult i32 %14, %24
  br i1 %25, label %26, label %160

26:                                               ; preds = %4
  %27 = icmp uge i32 %23, %24
  %28 = icmp eq i32 %14, 0
  %29 = select i1 %27, i1 true, i1 %28
  %30 = icmp eq i32 %23, 0
  %31 = or i1 %30, %29
  br i1 %31, label %160, label %32

32:                                               ; preds = %26
  %33 = add nuw nsw i32 %19, 2
  %34 = add nuw nsw i32 %33, %21
  %35 = add nuw nsw i32 %34, 1
  %36 = shl nuw nsw i32 %33, 1
  %37 = add nuw nsw i32 %36, %21
  %38 = add nuw nsw i32 %37, 1
  %39 = add i32 %20, 1
  %40 = mul i32 %5, %2
  %41 = add i32 %39, %40
  %42 = add i32 %20, %40
  %43 = mul nsw i32 %42, %2
  %44 = add nsw i32 %43, %20
  %45 = add i32 %22, %44
  %46 = mul nsw i32 %41, %2
  %47 = add nsw i32 %46, %20
  %48 = add i32 %22, %47
  %49 = add nsw i32 %41, 1
  %50 = mul nsw i32 %49, %2
  %51 = add nsw i32 %50, %20
  %52 = add i32 %22, %51
  %53 = add i32 %39, %5
  %54 = icmp slt i32 %53, %24
  br i1 %54, label %55, label %68

55:                                               ; preds = %32
  %56 = sext i32 %45 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %22
  store float %58, float addrspace(3)* %59, align 4, !tbaa !7
  %60 = sext i32 %48 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %35
  store float %62, float addrspace(3)* %63, align 4, !tbaa !7
  %64 = sext i32 %52 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %38
  store float %66, float addrspace(3)* %67, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %55, %32
  %69 = icmp eq i32 %5, 0
  br i1 %69, label %70, label %86

70:                                               ; preds = %68
  %71 = add i32 %44, %21
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %21
  store float %74, float addrspace(3)* %75, align 4, !tbaa !7
  %76 = add i32 %47, %21
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %34
  store float %79, float addrspace(3)* %80, align 4, !tbaa !7
  %81 = add i32 %51, %21
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %37
  store float %84, float addrspace(3)* %85, align 4, !tbaa !7
  br label %86

86:                                               ; preds = %70, %68
  %87 = add nsw i32 %3, -3
  %88 = sub i32 %87, %20
  %89 = icmp eq i32 %21, %88
  %90 = add nsw i32 %19, -1
  %91 = icmp eq i32 %21, %90
  %92 = select i1 %89, i1 true, i1 %91
  br i1 %92, label %97, label %93

93:                                               ; preds = %86
  %94 = add nuw nsw i32 %21, 2
  %95 = add nuw nsw i32 %34, 2
  %96 = add nuw nsw i32 %37, 2
  br label %116

97:                                               ; preds = %86
  %98 = add nsw i32 %45, 1
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = add nuw nsw i32 %21, 2
  %103 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %102
  store float %101, float addrspace(3)* %103, align 4, !tbaa !7
  %104 = add nsw i32 %48, 1
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = add nuw nsw i32 %34, 2
  %109 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %108
  store float %107, float addrspace(3)* %109, align 4, !tbaa !7
  %110 = add nsw i32 %52, 1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = add nuw nsw i32 %37, 2
  %115 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %114
  store float %113, float addrspace(3)* %115, align 4, !tbaa !7
  br label %116

116:                                              ; preds = %93, %97
  %117 = phi i32 [ %96, %93 ], [ %114, %97 ]
  %118 = phi i32 [ %95, %93 ], [ %108, %97 ]
  %119 = phi i32 [ %94, %93 ], [ %102, %97 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %120 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %35
  %121 = load float, float addrspace(3)* %120, align 4, !tbaa !7
  %122 = fmul contract float %121, 0x3FC99999A0000000
  %123 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %21
  %124 = load float, float addrspace(3)* %123, align 4, !tbaa !7
  %125 = fmul contract float %124, 0x3FB99999A0000000
  %126 = fadd contract float %122, %125
  %127 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %119
  %128 = load float, float addrspace(3)* %127, align 4, !tbaa !7
  %129 = fmul contract float %128, 0x3FB99999A0000000
  %130 = fadd contract float %126, %129
  %131 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %22
  %132 = load float, float addrspace(3)* %131, align 4, !tbaa !7
  %133 = fmul contract float %132, 0x3FB99999A0000000
  %134 = fadd contract float %130, %133
  %135 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %118
  %136 = load float, float addrspace(3)* %135, align 4, !tbaa !7
  %137 = fmul contract float %136, 0x3FB99999A0000000
  %138 = fadd contract float %134, %137
  %139 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %34
  %140 = load float, float addrspace(3)* %139, align 4, !tbaa !7
  %141 = fmul contract float %140, 0x3FB99999A0000000
  %142 = fadd contract float %138, %141
  %143 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %38
  %144 = load float, float addrspace(3)* %143, align 4, !tbaa !7
  %145 = fmul contract float %144, 0x3FB99999A0000000
  %146 = fadd contract float %142, %145
  %147 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %37
  %148 = load float, float addrspace(3)* %147, align 4, !tbaa !7
  %149 = fmul contract float %148, 0x3FB99999A0000000
  %150 = fadd contract float %146, %149
  %151 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %117
  %152 = load float, float addrspace(3)* %151, align 4, !tbaa !7
  %153 = fmul contract float %152, 0x3FB99999A0000000
  %154 = fadd contract float %150, %153
  %155 = fmul contract float %154, 0x3FEE666660000000
  %156 = mul i32 %14, %3
  %157 = add i32 %156, %23
  %158 = zext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  store float %155, float addrspace(1)* %159, align 4, !tbaa !7
  br label %160

160:                                              ; preds = %4, %26, %116
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

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

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
