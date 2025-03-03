; ModuleID = '../data/hip_kernels/5182/236/main.cu'
source_filename = "../data/hip_kernels/5182/236/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16Matrix_cos_naivePKfiiPfi(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture writeonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = udiv i32 %13, %10
  %17 = mul i32 %16, %10
  %18 = icmp ugt i32 %13, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %15
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %14
  %24 = mul i32 %23, %10
  %25 = add i32 %24, %22
  %26 = icmp slt i32 %25, %4
  br i1 %26, label %27, label %170

27:                                               ; preds = %5
  %28 = sext i32 %25 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !5
  %31 = tail call float @llvm.fabs.f32(float %30)
  %32 = fcmp olt float %31, 1.310720e+05
  br i1 %32, label %33, label %40

33:                                               ; preds = %27
  %34 = fmul float %31, 0x3FE45F3060000000
  %35 = tail call float @llvm.rint.f32(float %34)
  %36 = tail call float @llvm.fma.f32(float %35, float 0xBFF921FB40000000, float %31)
  %37 = tail call float @llvm.fma.f32(float %35, float 0xBE74442D00000000, float %36)
  %38 = tail call float @llvm.fma.f32(float %35, float 0xBCF8469880000000, float %37)
  %39 = fptosi float %35 to i32
  br label %146

40:                                               ; preds = %27
  %41 = bitcast float %31 to i32
  %42 = lshr i32 %41, 23
  %43 = and i32 %41, 8388607
  %44 = or i32 %43, 8388608
  %45 = zext i32 %44 to i64
  %46 = mul nuw nsw i64 %45, 4266746795
  %47 = trunc i64 %46 to i32
  %48 = lshr i64 %46, 32
  %49 = mul nuw nsw i64 %45, 1011060801
  %50 = add nuw nsw i64 %48, %49
  %51 = trunc i64 %50 to i32
  %52 = lshr i64 %50, 32
  %53 = mul nuw nsw i64 %45, 3680671129
  %54 = add nuw nsw i64 %52, %53
  %55 = trunc i64 %54 to i32
  %56 = lshr i64 %54, 32
  %57 = mul nuw nsw i64 %45, 4113882560
  %58 = add nuw nsw i64 %56, %57
  %59 = trunc i64 %58 to i32
  %60 = lshr i64 %58, 32
  %61 = mul nuw nsw i64 %45, 4230436817
  %62 = add nuw nsw i64 %60, %61
  %63 = trunc i64 %62 to i32
  %64 = lshr i64 %62, 32
  %65 = mul nuw nsw i64 %45, 1313084713
  %66 = add nuw nsw i64 %64, %65
  %67 = trunc i64 %66 to i32
  %68 = lshr i64 %66, 32
  %69 = mul nuw nsw i64 %45, 2734261102
  %70 = add nuw nsw i64 %68, %69
  %71 = trunc i64 %70 to i32
  %72 = lshr i64 %70, 32
  %73 = trunc i64 %72 to i32
  %74 = add nsw i32 %42, -120
  %75 = icmp ugt i32 %74, 63
  %76 = select i1 %75, i32 %67, i32 %73
  %77 = select i1 %75, i32 %63, i32 %71
  %78 = select i1 %75, i32 %59, i32 %67
  %79 = select i1 %75, i32 %55, i32 %63
  %80 = select i1 %75, i32 %51, i32 %59
  %81 = select i1 %75, i32 %47, i32 %55
  %82 = select i1 %75, i32 -64, i32 0
  %83 = add nsw i32 %82, %74
  %84 = icmp ugt i32 %83, 31
  %85 = select i1 %84, i32 %77, i32 %76
  %86 = select i1 %84, i32 %78, i32 %77
  %87 = select i1 %84, i32 %79, i32 %78
  %88 = select i1 %84, i32 %80, i32 %79
  %89 = select i1 %84, i32 %81, i32 %80
  %90 = select i1 %84, i32 -32, i32 0
  %91 = add nsw i32 %90, %83
  %92 = icmp ugt i32 %91, 31
  %93 = select i1 %92, i32 %86, i32 %85
  %94 = select i1 %92, i32 %87, i32 %86
  %95 = select i1 %92, i32 %88, i32 %87
  %96 = select i1 %92, i32 %89, i32 %88
  %97 = select i1 %92, i32 -32, i32 0
  %98 = add nsw i32 %97, %91
  %99 = icmp eq i32 %98, 0
  %100 = sub nsw i32 32, %98
  %101 = tail call i32 @llvm.fshr.i32(i32 %93, i32 %94, i32 %100)
  %102 = tail call i32 @llvm.fshr.i32(i32 %94, i32 %95, i32 %100)
  %103 = tail call i32 @llvm.fshr.i32(i32 %95, i32 %96, i32 %100)
  %104 = select i1 %99, i32 %93, i32 %101
  %105 = select i1 %99, i32 %94, i32 %102
  %106 = select i1 %99, i32 %95, i32 %103
  %107 = lshr i32 %104, 29
  %108 = tail call i32 @llvm.fshl.i32(i32 %104, i32 %105, i32 2)
  %109 = tail call i32 @llvm.fshl.i32(i32 %105, i32 %106, i32 2)
  %110 = tail call i32 @llvm.fshl.i32(i32 %106, i32 %96, i32 2)
  %111 = and i32 %107, 1
  %112 = sub nsw i32 0, %111
  %113 = shl i32 %107, 31
  %114 = xor i32 %108, %112
  %115 = xor i32 %109, %112
  %116 = xor i32 %110, %112
  %117 = tail call i32 @llvm.ctlz.i32(i32 %114, i1 false), !range !20
  %118 = sub nsw i32 31, %117
  %119 = tail call i32 @llvm.fshr.i32(i32 %114, i32 %115, i32 %118)
  %120 = tail call i32 @llvm.fshr.i32(i32 %115, i32 %116, i32 %118)
  %121 = shl nuw nsw i32 %117, 23
  %122 = sub nuw nsw i32 1056964608, %121
  %123 = lshr i32 %119, 9
  %124 = or i32 %123, %122
  %125 = or i32 %124, %113
  %126 = bitcast i32 %125 to float
  %127 = tail call i32 @llvm.fshl.i32(i32 %119, i32 %120, i32 23)
  %128 = tail call i32 @llvm.ctlz.i32(i32 %127, i1 false), !range !20
  %129 = fmul float %126, 0x3FF921FB40000000
  %130 = add nuw nsw i32 %128, %117
  %131 = shl nuw nsw i32 %130, 23
  %132 = sub nuw nsw i32 855638016, %131
  %133 = sub nsw i32 31, %128
  %134 = tail call i32 @llvm.fshr.i32(i32 %127, i32 %120, i32 %133)
  %135 = lshr i32 %134, 9
  %136 = or i32 %132, %135
  %137 = or i32 %136, %113
  %138 = bitcast i32 %137 to float
  %139 = fneg float %129
  %140 = tail call float @llvm.fma.f32(float %126, float 0x3FF921FB40000000, float %139)
  %141 = tail call float @llvm.fma.f32(float %126, float 0x3E74442D00000000, float %140)
  %142 = tail call float @llvm.fma.f32(float %138, float 0x3FF921FB40000000, float %141)
  %143 = fadd float %129, %142
  %144 = lshr i32 %104, 30
  %145 = add nuw nsw i32 %111, %144
  br label %146

146:                                              ; preds = %33, %40
  %147 = phi float [ %38, %33 ], [ %143, %40 ]
  %148 = phi i32 [ %39, %33 ], [ %145, %40 ]
  %149 = fmul float %147, %147
  %150 = tail call float @llvm.fmuladd.f32(float %149, float 0xBF29833040000000, float 0x3F81103880000000)
  %151 = tail call float @llvm.fmuladd.f32(float %149, float %150, float 0xBFC55553A0000000)
  %152 = fmul float %149, %151
  %153 = tail call float @llvm.fmuladd.f32(float %147, float %152, float %147)
  %154 = tail call float @llvm.fmuladd.f32(float %149, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %155 = tail call float @llvm.fmuladd.f32(float %149, float %154, float 0x3FA5557EE0000000)
  %156 = tail call float @llvm.fmuladd.f32(float %149, float %155, float 0xBFE0000080000000)
  %157 = tail call float @llvm.fmuladd.f32(float %149, float %156, float 1.000000e+00)
  %158 = fneg float %153
  %159 = and i32 %148, 1
  %160 = icmp eq i32 %159, 0
  %161 = select i1 %160, float %157, float %158
  %162 = bitcast float %161 to i32
  %163 = shl i32 %148, 30
  %164 = and i32 %163, -2147483648
  %165 = xor i32 %164, %162
  %166 = bitcast i32 %165 to float
  %167 = tail call i1 @llvm.amdgcn.class.f32(float %31, i32 504)
  %168 = select i1 %167, float %166, float 0x7FF8000000000000
  %169 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  store float %168, float addrspace(1)* %169, align 4, !tbaa !16
  br label %170

170:                                              ; preds = %146, %5
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{i32 0, i32 33}
