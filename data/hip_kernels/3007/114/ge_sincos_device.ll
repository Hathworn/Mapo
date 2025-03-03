; ModuleID = '../data/hip_kernels/3007/114/main.cu'
source_filename = "../data/hip_kernels/3007/114/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9ge_sincosiiPKfiiPfiiS1_ii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7, float addrspace(1)* nocapture writeonly %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %20, %0
  %30 = icmp slt i32 %28, %1
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %197

32:                                               ; preds = %11
  %33 = add nsw i32 %20, %3
  %34 = mul nsw i32 %28, %4
  %35 = add nsw i32 %33, %34
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = add nsw i32 %20, %6
  %40 = mul nsw i32 %28, %7
  %41 = add nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %5, i64 %42
  %44 = add nsw i32 %20, %9
  %45 = mul nsw i32 %28, %10
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %8, i64 %47
  %49 = tail call float @llvm.fabs.f32(float %38)
  %50 = fcmp olt float %49, 1.310720e+05
  br i1 %50, label %51, label %59

51:                                               ; preds = %32
  %52 = fmul float %49, 0x3FE45F3060000000
  %53 = tail call float @llvm.rint.f32(float %52)
  %54 = tail call float @llvm.fma.f32(float %53, float 0xBFF921FB40000000, float %49)
  %55 = tail call float @llvm.fma.f32(float %53, float 0xBE74442D00000000, float %54)
  %56 = tail call float @llvm.fma.f32(float %53, float 0xBCF8469880000000, float %55)
  %57 = fptosi float %53 to i32
  %58 = bitcast float %49 to i32
  br label %165

59:                                               ; preds = %32
  %60 = bitcast float %49 to i32
  %61 = lshr i32 %60, 23
  %62 = and i32 %60, 8388607
  %63 = or i32 %62, 8388608
  %64 = zext i32 %63 to i64
  %65 = mul nuw nsw i64 %64, 4266746795
  %66 = trunc i64 %65 to i32
  %67 = lshr i64 %65, 32
  %68 = mul nuw nsw i64 %64, 1011060801
  %69 = add nuw nsw i64 %67, %68
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = mul nuw nsw i64 %64, 3680671129
  %73 = add nuw nsw i64 %71, %72
  %74 = trunc i64 %73 to i32
  %75 = lshr i64 %73, 32
  %76 = mul nuw nsw i64 %64, 4113882560
  %77 = add nuw nsw i64 %75, %76
  %78 = trunc i64 %77 to i32
  %79 = lshr i64 %77, 32
  %80 = mul nuw nsw i64 %64, 4230436817
  %81 = add nuw nsw i64 %79, %80
  %82 = trunc i64 %81 to i32
  %83 = lshr i64 %81, 32
  %84 = mul nuw nsw i64 %64, 1313084713
  %85 = add nuw nsw i64 %83, %84
  %86 = trunc i64 %85 to i32
  %87 = lshr i64 %85, 32
  %88 = mul nuw nsw i64 %64, 2734261102
  %89 = add nuw nsw i64 %87, %88
  %90 = trunc i64 %89 to i32
  %91 = lshr i64 %89, 32
  %92 = trunc i64 %91 to i32
  %93 = add nsw i32 %61, -120
  %94 = icmp ugt i32 %93, 63
  %95 = select i1 %94, i32 %86, i32 %92
  %96 = select i1 %94, i32 %82, i32 %90
  %97 = select i1 %94, i32 %78, i32 %86
  %98 = select i1 %94, i32 %74, i32 %82
  %99 = select i1 %94, i32 %70, i32 %78
  %100 = select i1 %94, i32 %66, i32 %74
  %101 = select i1 %94, i32 -64, i32 0
  %102 = add nsw i32 %101, %93
  %103 = icmp ugt i32 %102, 31
  %104 = select i1 %103, i32 %96, i32 %95
  %105 = select i1 %103, i32 %97, i32 %96
  %106 = select i1 %103, i32 %98, i32 %97
  %107 = select i1 %103, i32 %99, i32 %98
  %108 = select i1 %103, i32 %100, i32 %99
  %109 = select i1 %103, i32 -32, i32 0
  %110 = add nsw i32 %109, %102
  %111 = icmp ugt i32 %110, 31
  %112 = select i1 %111, i32 %105, i32 %104
  %113 = select i1 %111, i32 %106, i32 %105
  %114 = select i1 %111, i32 %107, i32 %106
  %115 = select i1 %111, i32 %108, i32 %107
  %116 = select i1 %111, i32 -32, i32 0
  %117 = add nsw i32 %116, %110
  %118 = icmp eq i32 %117, 0
  %119 = sub nsw i32 32, %117
  %120 = tail call i32 @llvm.fshr.i32(i32 %112, i32 %113, i32 %119)
  %121 = tail call i32 @llvm.fshr.i32(i32 %113, i32 %114, i32 %119)
  %122 = tail call i32 @llvm.fshr.i32(i32 %114, i32 %115, i32 %119)
  %123 = select i1 %118, i32 %112, i32 %120
  %124 = select i1 %118, i32 %113, i32 %121
  %125 = select i1 %118, i32 %114, i32 %122
  %126 = lshr i32 %123, 29
  %127 = tail call i32 @llvm.fshl.i32(i32 %123, i32 %124, i32 2)
  %128 = tail call i32 @llvm.fshl.i32(i32 %124, i32 %125, i32 2)
  %129 = tail call i32 @llvm.fshl.i32(i32 %125, i32 %115, i32 2)
  %130 = and i32 %126, 1
  %131 = sub nsw i32 0, %130
  %132 = shl i32 %126, 31
  %133 = xor i32 %127, %131
  %134 = xor i32 %128, %131
  %135 = xor i32 %129, %131
  %136 = tail call i32 @llvm.ctlz.i32(i32 %133, i1 false), !range !11
  %137 = sub nsw i32 31, %136
  %138 = tail call i32 @llvm.fshr.i32(i32 %133, i32 %134, i32 %137)
  %139 = tail call i32 @llvm.fshr.i32(i32 %134, i32 %135, i32 %137)
  %140 = shl nuw nsw i32 %136, 23
  %141 = sub nuw nsw i32 1056964608, %140
  %142 = lshr i32 %138, 9
  %143 = or i32 %142, %141
  %144 = or i32 %143, %132
  %145 = bitcast i32 %144 to float
  %146 = tail call i32 @llvm.fshl.i32(i32 %138, i32 %139, i32 23)
  %147 = tail call i32 @llvm.ctlz.i32(i32 %146, i1 false), !range !11
  %148 = fmul float %145, 0x3FF921FB40000000
  %149 = add nuw nsw i32 %147, %136
  %150 = shl nuw nsw i32 %149, 23
  %151 = sub nuw nsw i32 855638016, %150
  %152 = sub nsw i32 31, %147
  %153 = tail call i32 @llvm.fshr.i32(i32 %146, i32 %139, i32 %152)
  %154 = lshr i32 %153, 9
  %155 = or i32 %151, %154
  %156 = or i32 %155, %132
  %157 = bitcast i32 %156 to float
  %158 = fneg float %148
  %159 = tail call float @llvm.fma.f32(float %145, float 0x3FF921FB40000000, float %158)
  %160 = tail call float @llvm.fma.f32(float %145, float 0x3E74442D00000000, float %159)
  %161 = tail call float @llvm.fma.f32(float %157, float 0x3FF921FB40000000, float %160)
  %162 = fadd float %148, %161
  %163 = lshr i32 %123, 30
  %164 = add nuw nsw i32 %130, %163
  br label %165

165:                                              ; preds = %51, %59
  %166 = phi i32 [ %58, %51 ], [ %60, %59 ]
  %167 = phi float [ %56, %51 ], [ %162, %59 ]
  %168 = phi i32 [ %57, %51 ], [ %164, %59 ]
  %169 = fmul float %167, %167
  %170 = tail call float @llvm.fmuladd.f32(float %169, float 0xBF29833040000000, float 0x3F81103880000000)
  %171 = tail call float @llvm.fmuladd.f32(float %169, float %170, float 0xBFC55553A0000000)
  %172 = fmul float %169, %171
  %173 = tail call float @llvm.fmuladd.f32(float %167, float %172, float %167)
  %174 = tail call float @llvm.fmuladd.f32(float %169, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %175 = tail call float @llvm.fmuladd.f32(float %169, float %174, float 0x3FA5557EE0000000)
  %176 = tail call float @llvm.fmuladd.f32(float %169, float %175, float 0xBFE0000080000000)
  %177 = tail call float @llvm.fmuladd.f32(float %169, float %176, float 1.000000e+00)
  %178 = shl i32 %168, 30
  %179 = and i32 %178, -2147483648
  %180 = and i32 %168, 1
  %181 = icmp eq i32 %180, 0
  %182 = select i1 %181, float %173, float %177
  %183 = bitcast float %182 to i32
  %184 = bitcast float %38 to i32
  %185 = xor i32 %166, %184
  %186 = xor i32 %185, %183
  %187 = xor i32 %186, %179
  %188 = bitcast i32 %187 to float
  %189 = fneg float %173
  %190 = select i1 %181, float %177, float %189
  %191 = bitcast float %190 to i32
  %192 = xor i32 %179, %191
  %193 = bitcast i32 %192 to float
  %194 = tail call i1 @llvm.amdgcn.class.f32(float %49, i32 504)
  %195 = select i1 %194, float %193, float 0x7FF8000000000000
  %196 = select i1 %194, float %188, float 0x7FF8000000000000
  store float %196, float addrspace(1)* %43, align 4, !tbaa !7
  store float %195, float addrspace(1)* %48, align 4, !tbaa !7
  br label %197

197:                                              ; preds = %165, %11
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i32 0, i32 33}
