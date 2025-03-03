; ModuleID = '../data/hip_kernels/7801/34/main.cu'
source_filename = "../data/hip_kernels/7801/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_cosf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = sext i32 %12 to i64
  %14 = icmp ult i64 %13, %0
  br i1 %14, label %15, label %157

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fcmp olt float %18, 1.310720e+05
  br i1 %19, label %20, label %27

20:                                               ; preds = %15
  %21 = fmul float %18, 0x3FE45F3060000000
  %22 = tail call float @llvm.rint.f32(float %21)
  %23 = tail call float @llvm.fma.f32(float %22, float 0xBFF921FB40000000, float %18)
  %24 = tail call float @llvm.fma.f32(float %22, float 0xBE74442D00000000, float %23)
  %25 = tail call float @llvm.fma.f32(float %22, float 0xBCF8469880000000, float %24)
  %26 = fptosi float %22 to i32
  br label %133

27:                                               ; preds = %15
  %28 = bitcast float %18 to i32
  %29 = lshr i32 %28, 23
  %30 = and i32 %28, 8388607
  %31 = or i32 %30, 8388608
  %32 = zext i32 %31 to i64
  %33 = mul nuw nsw i64 %32, 4266746795
  %34 = trunc i64 %33 to i32
  %35 = lshr i64 %33, 32
  %36 = mul nuw nsw i64 %32, 1011060801
  %37 = add nuw nsw i64 %35, %36
  %38 = trunc i64 %37 to i32
  %39 = lshr i64 %37, 32
  %40 = mul nuw nsw i64 %32, 3680671129
  %41 = add nuw nsw i64 %39, %40
  %42 = trunc i64 %41 to i32
  %43 = lshr i64 %41, 32
  %44 = mul nuw nsw i64 %32, 4113882560
  %45 = add nuw nsw i64 %43, %44
  %46 = trunc i64 %45 to i32
  %47 = lshr i64 %45, 32
  %48 = mul nuw nsw i64 %32, 4230436817
  %49 = add nuw nsw i64 %47, %48
  %50 = trunc i64 %49 to i32
  %51 = lshr i64 %49, 32
  %52 = mul nuw nsw i64 %32, 1313084713
  %53 = add nuw nsw i64 %51, %52
  %54 = trunc i64 %53 to i32
  %55 = lshr i64 %53, 32
  %56 = mul nuw nsw i64 %32, 2734261102
  %57 = add nuw nsw i64 %55, %56
  %58 = trunc i64 %57 to i32
  %59 = lshr i64 %57, 32
  %60 = trunc i64 %59 to i32
  %61 = add nsw i32 %29, -120
  %62 = icmp ugt i32 %61, 63
  %63 = select i1 %62, i32 %54, i32 %60
  %64 = select i1 %62, i32 %50, i32 %58
  %65 = select i1 %62, i32 %46, i32 %54
  %66 = select i1 %62, i32 %42, i32 %50
  %67 = select i1 %62, i32 %38, i32 %46
  %68 = select i1 %62, i32 %34, i32 %42
  %69 = select i1 %62, i32 -64, i32 0
  %70 = add nsw i32 %69, %61
  %71 = icmp ugt i32 %70, 31
  %72 = select i1 %71, i32 %64, i32 %63
  %73 = select i1 %71, i32 %65, i32 %64
  %74 = select i1 %71, i32 %66, i32 %65
  %75 = select i1 %71, i32 %67, i32 %66
  %76 = select i1 %71, i32 %68, i32 %67
  %77 = select i1 %71, i32 -32, i32 0
  %78 = add nsw i32 %77, %70
  %79 = icmp ugt i32 %78, 31
  %80 = select i1 %79, i32 %73, i32 %72
  %81 = select i1 %79, i32 %74, i32 %73
  %82 = select i1 %79, i32 %75, i32 %74
  %83 = select i1 %79, i32 %76, i32 %75
  %84 = select i1 %79, i32 -32, i32 0
  %85 = add nsw i32 %84, %78
  %86 = icmp eq i32 %85, 0
  %87 = sub nsw i32 32, %85
  %88 = tail call i32 @llvm.fshr.i32(i32 %80, i32 %81, i32 %87)
  %89 = tail call i32 @llvm.fshr.i32(i32 %81, i32 %82, i32 %87)
  %90 = tail call i32 @llvm.fshr.i32(i32 %82, i32 %83, i32 %87)
  %91 = select i1 %86, i32 %80, i32 %88
  %92 = select i1 %86, i32 %81, i32 %89
  %93 = select i1 %86, i32 %82, i32 %90
  %94 = lshr i32 %91, 29
  %95 = tail call i32 @llvm.fshl.i32(i32 %91, i32 %92, i32 2)
  %96 = tail call i32 @llvm.fshl.i32(i32 %92, i32 %93, i32 2)
  %97 = tail call i32 @llvm.fshl.i32(i32 %93, i32 %83, i32 2)
  %98 = and i32 %94, 1
  %99 = sub nsw i32 0, %98
  %100 = shl i32 %94, 31
  %101 = xor i32 %95, %99
  %102 = xor i32 %96, %99
  %103 = xor i32 %97, %99
  %104 = tail call i32 @llvm.ctlz.i32(i32 %101, i1 false), !range !11
  %105 = sub nsw i32 31, %104
  %106 = tail call i32 @llvm.fshr.i32(i32 %101, i32 %102, i32 %105)
  %107 = tail call i32 @llvm.fshr.i32(i32 %102, i32 %103, i32 %105)
  %108 = shl nuw nsw i32 %104, 23
  %109 = sub nuw nsw i32 1056964608, %108
  %110 = lshr i32 %106, 9
  %111 = or i32 %110, %109
  %112 = or i32 %111, %100
  %113 = bitcast i32 %112 to float
  %114 = tail call i32 @llvm.fshl.i32(i32 %106, i32 %107, i32 23)
  %115 = tail call i32 @llvm.ctlz.i32(i32 %114, i1 false), !range !11
  %116 = fmul float %113, 0x3FF921FB40000000
  %117 = add nuw nsw i32 %115, %104
  %118 = shl nuw nsw i32 %117, 23
  %119 = sub nuw nsw i32 855638016, %118
  %120 = sub nsw i32 31, %115
  %121 = tail call i32 @llvm.fshr.i32(i32 %114, i32 %107, i32 %120)
  %122 = lshr i32 %121, 9
  %123 = or i32 %119, %122
  %124 = or i32 %123, %100
  %125 = bitcast i32 %124 to float
  %126 = fneg float %116
  %127 = tail call float @llvm.fma.f32(float %113, float 0x3FF921FB40000000, float %126)
  %128 = tail call float @llvm.fma.f32(float %113, float 0x3E74442D00000000, float %127)
  %129 = tail call float @llvm.fma.f32(float %125, float 0x3FF921FB40000000, float %128)
  %130 = fadd float %116, %129
  %131 = lshr i32 %91, 30
  %132 = add nuw nsw i32 %98, %131
  br label %133

133:                                              ; preds = %20, %27
  %134 = phi float [ %25, %20 ], [ %130, %27 ]
  %135 = phi i32 [ %26, %20 ], [ %132, %27 ]
  %136 = fmul float %134, %134
  %137 = tail call float @llvm.fmuladd.f32(float %136, float 0xBF29833040000000, float 0x3F81103880000000)
  %138 = tail call float @llvm.fmuladd.f32(float %136, float %137, float 0xBFC55553A0000000)
  %139 = fmul float %136, %138
  %140 = tail call float @llvm.fmuladd.f32(float %134, float %139, float %134)
  %141 = tail call float @llvm.fmuladd.f32(float %136, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %142 = tail call float @llvm.fmuladd.f32(float %136, float %141, float 0x3FA5557EE0000000)
  %143 = tail call float @llvm.fmuladd.f32(float %136, float %142, float 0xBFE0000080000000)
  %144 = tail call float @llvm.fmuladd.f32(float %136, float %143, float 1.000000e+00)
  %145 = fneg float %140
  %146 = and i32 %135, 1
  %147 = icmp eq i32 %146, 0
  %148 = select i1 %147, float %144, float %145
  %149 = bitcast float %148 to i32
  %150 = shl i32 %135, 30
  %151 = and i32 %150, -2147483648
  %152 = xor i32 %151, %149
  %153 = bitcast i32 %152 to float
  %154 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 504)
  %155 = select i1 %154, float %153, float 0x7FF8000000000000
  %156 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %155, float addrspace(1)* %156, align 4, !tbaa !7
  br label %157

157:                                              ; preds = %133, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{i32 0, i32 33}
